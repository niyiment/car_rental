import 'package:equatable/equatable.dart';

enum PaymentStatus {
  pending,
  processing,
  succeeded,
  failed,
  cancelled,
  refunded,
}

enum PaymentMethod {
  card,
  cash,
}

class Payment extends Equatable {

  const Payment({
    required this.id,
    required this.bookingId,
    required this.amount,
    required this.status,
    required this.method,
    required this.createdAt,
    this.currency = 'usd',
    this.paidAt,
    this.paymentIntentId,
    this.transactionId,
    this.paymentMethodId,
    this.errorMessage,
  });

  final String id;
  final String bookingId;
  final double amount;
  final String currency;
  final PaymentStatus status;
  final PaymentMethod method;
  final DateTime createdAt;
  final DateTime? paidAt;
  final String? paymentIntentId;
  final String? transactionId;
  final String? paymentMethodId;
  final String? errorMessage;

  @override
  List<Object?> get props => [
    id,
    bookingId,
    amount,
    currency,
    status,
    method,
    createdAt,
    paidAt,
    paymentIntentId,
    transactionId,
    paymentMethodId,
    errorMessage,
  ];

  Payment copyWith({
    String? id,
    String? bookingId,
    double? amount,
    String? currency,
    PaymentStatus? status,
    PaymentMethod? method,
    DateTime? createdAt,
    DateTime? paidAt,
    String? paymentIntentId,
    String? transactionId,
    String? paymentMethodId,
    String? errorMessage,
  }) {
    return Payment(
      id: id ?? this.id,
      bookingId: bookingId ?? this.bookingId,
      amount: amount ?? this.amount,
      currency: currency ?? this.currency,
      status: status ?? this.status,
      method: method ?? this.method,
      createdAt: createdAt ?? this.createdAt,
      paidAt: paidAt ?? this.paidAt,
      paymentIntentId: paymentIntentId ?? this.paymentIntentId,
      transactionId: transactionId ?? this.transactionId,
      paymentMethodId: paymentMethodId ?? this.paymentMethodId,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  String get statusText {
    switch (status) {
      case PaymentStatus.pending:
        return 'Pending';
      case PaymentStatus.processing:
        return 'Processing';
      case PaymentStatus.succeeded:
        return 'Paid';
      case PaymentStatus.failed:
        return 'Failed';
      case PaymentStatus.cancelled:
        return 'Cancelled';
      case PaymentStatus.refunded:
        return 'Refunded';
    }
  }

  String get methodText {
    switch (method) {
      case PaymentMethod.card:
        return 'Card';
      case PaymentMethod.cash:
        return 'Cash';
    }
  }

  bool get isPaid => status == PaymentStatus.succeeded;
  bool get isFailed => status == PaymentStatus.failed;
  bool get isPending => status == PaymentStatus.pending;
  bool get isProcessing => status == PaymentStatus.processing;

  String get displayAmount => '\$${amount.toStringAsFixed(2)}';

}
