
import 'package:car_rental/domain/data/dummy_data.dart';
import 'package:car_rental/domain/entities/car.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final carListProvider = Provider<List<Car>>((ref) {
  return DummyData.cars;
});

final availableCarsProvider = Provider<List<Car>>((ref) {
  final cars = ref.watch(carListProvider);
  return cars.where((car) => car.isAvailable).toList();
});

class SelectedCategoryNotifier extends Notifier<String> {
  @override
  String build() => 'All';

  void setCategory(String category) => state = category;
}

final selectedCategoryProvider = NotifierProvider<SelectedCategoryNotifier, String>(SelectedCategoryNotifier.new);

final filteredCarsProvider = Provider<List<Car>>((ref) {
  final cars = ref.watch(carListProvider);
  final selectedCategory = ref.watch(selectedCategoryProvider);

  if (selectedCategory == 'All') {
    return cars;
  }

  return cars.where((car) => car.category == selectedCategory).toList();
});

final categoriesProvider = Provider<List<String>>((ref) =>  ['All',...DummyData.categories]);

final selectedCarProvider = NotifierProvider<SelectedCarNotifier, Car?>(SelectedCarNotifier.new);

class SelectedCarNotifier extends Notifier<Car?> {
  @override
  Car? build() => null;
  void setCar(Car car) => state = car;

  void clear() => state = null;
}

final carByIdProvider = Provider.family<Car?, String>((ref, id) => DummyData.getCarById(id));

final searchQueryProvider = NotifierProvider<SearchQueryNotifier,String>(SearchQueryNotifier.new);

class SearchQueryNotifier extends Notifier<String>{
  @override
  String build() => '';

  void setQuery(String query) => state = query;

  void clear() => state = '';
}

final searchedCarsProvider = Provider<List<Car>>((ref) {
  final cars = ref.watch(filteredCarsProvider);
  final query = ref.watch(searchQueryProvider).toLowerCase();

  if (query.isEmpty) {
    return cars;
  }

  return cars.where((car) {
    return car.name.toLowerCase().contains(query) ||
        car.model.toLowerCase().contains(query) ||
        car.category.toLowerCase().contains(query);
  }).toList();
});

final favoriteCarIdsProvider = NotifierProvider<FavoriteCarIdsNotifier, Set<String>>(
  FavoriteCarIdsNotifier.new,
);

class FavoriteCarIdsNotifier extends Notifier<Set<String>> {
  @override
  Set<String> build() {
    return {};
  }

  void toggleFavorite(String carId) {
    final newFavorites = {...state};
    if (newFavorites.contains(carId)) {
      newFavorites.remove(carId);
    } else {
      newFavorites.add(carId);
    }
    state = newFavorites;
  }

  void addFavorite(String carId) {
    state = {...state, carId};
  }

  void removeFavorite(String carId) {
    state = {...state}..remove(carId);
  }

  void clearFavorites() {
    state = {};
  }
}

final toggleFavoriteProvider = Provider((ref) {
  return (String carId) {
    final favorites = ref.read(favoriteCarIdsProvider.notifier);
    final currentFavorites = ref.read(favoriteCarIdsProvider);

    if (currentFavorites.contains(carId)) {
      favorites.state = {...currentFavorites}..remove(carId);
    } else {
      favorites.state = {...currentFavorites, carId};
    }
  };
});

// Is Favorite Provider
final isFavoriteProvider = Provider.family<bool, String>((ref, carId) {
  final favorites = ref.watch(favoriteCarIdsProvider);
  return favorites.contains(carId);
});

// Favorite Cars List Provider
final favoritesCarsProvider = Provider<List<Car>>((ref) {
  final favorites = ref.watch(favoriteCarIdsProvider);
  final cars = ref.watch(carListProvider);

  return cars.where((car) => favorites.contains(car.id)).toList();
});


