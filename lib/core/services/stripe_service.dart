import 'dart:convert';

import 'package:car_rental/core/utils/env.dart';
import 'package:car_rental/models/payment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart' hide PaymentMethod;
import 'package:http/http.dart' as http;

class StripeService {
  static Future<void> init() async {
    try {
      Stripe.publishableKey = Env.stripePublishableKey;
      await Stripe.instance.applySettings();
    } catch (e) {
      throw Exception('Error initializing Stripe: $e');
    }
  }

  // Create payment intent (in production, this should be done on your backend)
  static Future<Map<String, dynamic>> createPaymentIntent({
    required double amount,
    required String currency,
    String? description,
  }) async {
    try {
      final int amountInCents = (amount * 100).toInt();

      final response = await http.post(
        Uri.parse('https://api.stripe.com/v1/payment_intents'),
        headers: {
          'Authorization': 'Bearer ${Env.stripeSecretKey}',
          'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: {
          'amount': amountInCents.toString(),
          'currency': currency,
          'description': description ?? 'Car rental payment',
          'payment_method_types[]': 'card',
        },
      );

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Failed to create payment intent: ${response.body}');
      }
    } catch (e) {
      throw Exception('Error creating payment intent: $e');
    }
  }

  // Process payment
  static Future<Payment> processPayment({
    required String bookingId,
    required double amount,
    required String currency,
    required BillingDetails billingDetails,
  }) async {
    try {
      // create payment intent
      final paymentIntentData = await createPaymentIntent(
        amount: amount,
        currency: currency,
        description: 'Car Rental - Booking #$bookingId',
      );

      final clientSecret = paymentIntentData['client_secret'];
      final paymentIntentId = paymentIntentData['id'];

      // Confirm payment with stripe
      final paymentIntent = await Stripe.instance.confirmPayment(
        paymentIntentClientSecret: clientSecret,
        data: PaymentMethodParams.card(
          paymentMethodData: PaymentMethodData(billingDetails: billingDetails),
        ),
      );

      // Create payment record
      final payment = Payment(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        bookingId: bookingId,
        amount: amount,
        currency: currency,
        status: PaymentStatus.succeeded,
        method: PaymentMethod.card,
        createdAt: DateTime.now(),
        paidAt: DateTime.now(),
        paymentIntentId: paymentIntentId,
        transactionId: paymentIntent.id,
        paymentMethodId: paymentIntent.paymentMethodId,
      );

      return payment;
    } on StripeException catch (e) {
      return Payment(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        bookingId: bookingId,
        amount: amount,
        currency: currency,
        status: PaymentStatus.failed,
        method: PaymentMethod.card,
        createdAt: DateTime.now(),
        errorMessage: e.error.message ?? 'Payment failed',
      );
    } catch (e) {
      return Payment(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        bookingId: bookingId,
        amount: amount,
        currency: currency,
        status: PaymentStatus.failed,
        method: PaymentMethod.card,
        createdAt: DateTime.now(),
        errorMessage: 'An error occurred while processing the payment: $e',
      );
    }
  }

  // Present card payment sheet
  static Future<Payment> presentPaymentSheet({
    required String bookingId,
    required double amount,
    required String currency,
    required String customerEmail,
  }) async {
    try {
      final paymentIntentData = await createPaymentIntent(
        amount: amount,
        currency: currency,
        description: 'Car Rental - Booking #$bookingId',
      );
      final clientSecret = paymentIntentData['client_secret'];
      final paymentIntentId = paymentIntentData['id'];

      // Initialize payment sheet
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          merchantDisplayName: 'Car Rental',
          paymentIntentClientSecret: clientSecret,
          customerEphemeralKeySecret: null,
          customerId: null,
          style: ThemeMode.system,
          billingDetailsCollectionConfiguration: const BillingDetailsCollectionConfiguration(
            email: CollectionMode.always,
            phone: CollectionMode.always,
          ),
        ),
      );

      // Present payment sheet
      await Stripe.instance.presentPaymentSheet();

      // Payment successful
      return Payment(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        bookingId: bookingId,
        amount: amount,
        currency: currency,
        status: PaymentStatus.succeeded,
        method: PaymentMethod.card,
        createdAt: DateTime.now(),
        paidAt: DateTime.now(),
        paymentIntentId: paymentIntentId,
      );
    } on StripeException catch (e) {
      if (e.error.code == FailureCode.Canceled) {
        return Payment(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          bookingId: bookingId,
          amount: amount,
          currency: currency,
          status: PaymentStatus.cancelled,
          method: PaymentMethod.card,
          createdAt: DateTime.now(),
          errorMessage: 'Payment cancelled by user',
        );
      } else {
        return Payment(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          bookingId: bookingId,
          amount: amount,
          currency: currency,
          status: PaymentStatus.failed,
          method: PaymentMethod.card,
          createdAt: DateTime.now(),
          errorMessage: e.error.message ?? 'Payment failed',
        );
      }
    } catch (e) {
      return Payment(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        bookingId: bookingId,
        amount: amount,
        currency: currency,
        status: PaymentStatus.failed,
        method: PaymentMethod.card,
        createdAt: DateTime.now(),
        errorMessage: 'An error occurred: $e',
      );
    }
  }
}
