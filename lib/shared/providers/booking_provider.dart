
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/booking.dart';

final bookingsProvider = NotifierProvider<BookingsNotifier, List<Booking>>(
  BookingsNotifier.new,
);

class BookingsNotifier extends Notifier<List<Booking>> {
  @override
  List<Booking> build() {
    return [];
  }

  void addBooking(Booking booking) {
    state = [...state, booking];
  }

  void cancelBooking(String bookingId) {
    state = state.map((booking) {
      if (booking.id == bookingId) {
        return booking.copyWith(status: BookingStatus.cancelled);
      }
      return booking;
    }).toList();
  }

  void updateBooking(Booking updatedBooking) {
    state = state.map((booking) {
      if (booking.id == updatedBooking.id) {
        return updatedBooking;
      }
      return booking;
    }).toList();
  }

  void removeBooking(String bookingId) {
    state = state.where((booking) => booking.id != bookingId).toList();
  }

  void clearAll() {
    state = [];
  }

  Booking? getBookingById(String id) {
    try {
      return state.firstWhere((booking) => booking.id == id);
    } catch (e) {
      return null;
    }
  }
}

// Get Booking By ID Provider
final bookingByIdProvider = Provider.family<Booking?, String>((ref, id) {
  return ref.watch(bookingsProvider.notifier).getBookingById(id);
});

// Active Bookings Provider
final activeBookingsProvider = Provider<List<Booking>>((ref) {
  final bookings = ref.watch(bookingsProvider);
  return bookings.where((booking) => booking.isActive).toList();
});

// Completed Bookings Provider
final completedBookingsProvider = Provider<List<Booking>>((ref) {
  final bookings = ref.watch(bookingsProvider);
  return bookings.where((booking) => booking.isCompleted).toList();
});

// Pending Bookings Provider
final pendingBookingsProvider = Provider<List<Booking>>((ref) {
  final bookings = ref.watch(bookingsProvider);
  return bookings.where((booking) => booking.isPending).toList();
});

// Cancelled Bookings Provider
final cancelledBookingsProvider = Provider<List<Booking>>((ref) {
  final bookings = ref.watch(bookingsProvider);
  return bookings.where((booking) => booking.isCancelled).toList();
});

// Total Bookings Count
final totalBookingsCountProvider = Provider<int>((ref) {
  final bookings = ref.watch(bookingsProvider);
  return bookings.length;
});

// Total Spent Provider
final totalSpentProvider = Provider<double>((ref) {
  final bookings = ref.watch(bookingsProvider);
  return bookings.fold(0.0, (sum, booking) => sum + booking.totalPrice);
});

// Has Active Booking for Car Provider
final hasActiveBookingForCarProvider = Provider.family<bool, String>((ref, carId) {
  final activeBookings = ref.watch(activeBookingsProvider);
  return activeBookings.any((booking) => booking.car.id == carId);
});

