
import 'package:car_rental/models/payment.dart';
import 'package:car_rental/core/services/stripe_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final paymentsProvider = NotifierProvider<PaymentsNotifier, List<Payment>>(
  PaymentsNotifier.new
);

class PaymentsNotifier extends Notifier<List<Payment>> {
  @override
  List<Payment> build() => [];

  void addPayment(Payment payment) {
    state = [...state, payment];
  }
}

final addPaymentProvider = Provider((ref) {
  return (Payment payment) {
    ref.read(paymentsProvider.notifier).addPayment(payment);
  };
});

final paymentByBookingIdProvider = Provider.family<Payment?, String>((ref, bookingId) {
  final payments = ref.watch(paymentsProvider);
  try {
    return payments.firstWhere((payment) => payment.bookingId == bookingId);
  } catch (e) {
    return null;
  }
});

final processPaymentProvider = Provider((ref) {
  return ({
    required String bookingId,
    required double amount,
    required String currency,
    required String customerEmail,
  }) async {
    try {
      final payment = await StripeService.presentPaymentSheet(
          bookingId: bookingId,
          amount: amount,
          currency: currency,
          customerEmail: customerEmail
      );

      ref.read(addPaymentProvider)(payment);

      return payment;
    } catch (e) {
      final failedPayment = Payment(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        bookingId: bookingId,
        amount: amount,
        currency: currency,
        method: PaymentMethod.card,
        status: PaymentStatus.failed,
        createdAt: DateTime.now(),
        errorMessage: e.toString(),
      );

      ref.read(addPaymentProvider)(failedPayment);
      return failedPayment;
    }
  };
});

final successfulPaymentsProvider = Provider<List<Payment>>((ref) {
  final payments = ref.watch(paymentsProvider);
  return payments.where((payment) => payment.isPaid).toList();
});

final totalPaymentsProvider = Provider<double>((ref) {
  final payments = ref.watch(successfulPaymentsProvider);
  return payments.fold(0.0, (previousValue, payment) => previousValue + payment.amount);
});

final paymentLoadingProvider = NotifierProvider<PaymentLoadingNotifier, bool>(
  PaymentLoadingNotifier.new
);

class PaymentLoadingNotifier extends Notifier<bool> {

  @override
  bool build() => false;

  void setLoading(bool loading)  =>  state = loading;
}


