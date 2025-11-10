import 'package:equatable/equatable.dart';
import 'car.dart';

enum BookingStatus {
  pending,
  confirmed,
  active,
  completed,
  cancelled,
}

class Booking extends Equatable {
  final String id;
  final Car car;
  final DateTime startDate;
  final DateTime endDate;
  final int numberOfDays;
  final double totalPrice;
  final BookingStatus status;
  final DateTime bookingDate;
  final String customerName;
  final String customerEmail;
  final String customerPhone;
  final String? notes;

  const Booking({
    required this.id,
    required this.car,
    required this.startDate,
    required this.endDate,
    required this.numberOfDays,
    required this.totalPrice,
    required this.status,
    required this.bookingDate,
    required this.customerName,
    required this.customerEmail,
    required this.customerPhone,
    this.notes,
  });

  @override
  List<Object?> get props => [
    id,
    car,
    startDate,
    endDate,
    numberOfDays,
    totalPrice,
    status,
    bookingDate,
    customerName,
    customerEmail,
    customerPhone,
    notes,
  ];

  Booking copyWith({
    String? id,
    Car? car,
    DateTime? startDate,
    DateTime? endDate,
    int? numberOfDays,
    double? totalPrice,
    BookingStatus? status,
    DateTime? bookingDate,
    String? customerName,
    String? customerEmail,
    String? customerPhone,
    String? notes,
  }) {
    return Booking(
      id: id ?? this.id,
      car: car ?? this.car,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      numberOfDays: numberOfDays ?? this.numberOfDays,
      totalPrice: totalPrice ?? this.totalPrice,
      status: status ?? this.status,
      bookingDate: bookingDate ?? this.bookingDate,
      customerName: customerName ?? this.customerName,
      customerEmail: customerEmail ?? this.customerEmail,
      customerPhone: customerPhone ?? this.customerPhone,
      notes: notes ?? this.notes,
    );
  }

  String get statusText {
    switch (status) {
      case BookingStatus.pending:
        return 'Pending';
      case BookingStatus.confirmed:
        return 'Confirmed';
      case BookingStatus.active:
        return 'Active';
      case BookingStatus.completed:
        return 'Completed';
      case BookingStatus.cancelled:
        return 'Cancelled';
    }
  }

  bool get isActive => status == BookingStatus.active || status == BookingStatus.confirmed;
  bool get isPending => status == BookingStatus.pending;
  bool get isCompleted => status == BookingStatus.completed;
  bool get isCancelled => status == BookingStatus.cancelled;
}
