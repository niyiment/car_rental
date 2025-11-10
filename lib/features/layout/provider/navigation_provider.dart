import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Bottom Navigation Index Provider
final bottomNavIndexProvider = NotifierProvider<BottomNavIndexNotifier, int>(
  BottomNavIndexNotifier.new,
);

class BottomNavIndexNotifier extends Notifier<int> {
  @override
  int build() {
    return 0;
  }

  void setIndex(int index) {
    state = index;
  }

  void reset() {
    state = 0;
  }
}

// Navigation Items
class NavigationItem {

  const NavigationItem({
    required this.label,
    required this.icon,
  });

  final String label;
  final IconData icon;
}

final navigationItemsProvider = Provider<List<NavigationItem>>((ref) {
  return const [
    NavigationItem(label: 'Home', icon: Icons.home),
    NavigationItem(label: 'Favorites', icon: Icons.search),
    NavigationItem(label: 'Bookings', icon: Icons.book),
    NavigationItem(label: 'Profile', icon: Icons.person),
  ];
});