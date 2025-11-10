
import 'package:equatable/equatable.dart';

class Car extends Equatable {

  const Car({
    required this.id,
    required this.name,
    required this.model,
    this.brand = 'Hyundai',
    required this.year,
    required this.pricePerDay,
    required this.imageUrl,
    required this.category,
    required this.transmission,
    required this.fuelType,
    required this.seats,
    required this.rating,
    required this.reviews,
    required this.features,
    required this.description,
    this.isAvailable = true,
    this.location,
  });
  
  final String id;
  final String name;
  final String model;
  final String brand;
  final int year;
  final double pricePerDay;
  final String imageUrl;
  final String category;
  final String transmission;
  final String fuelType;
  final int seats;
  final double rating;
  final int reviews;
  final List<String> features;
  final String description;
  final bool isAvailable;
  final String? location;

  @override
  List<Object?> get props => [
    id,
    name,
    model,
    brand,
    year,
    pricePerDay,
    imageUrl,
    category,
    transmission,
    fuelType,
    seats,
    rating,
    reviews,
    features,
    description,
    isAvailable,
    location,
  ];

  Car copyWith({
    String? id,
    String? name,
    String? model,
    String? brand,
    int? year,
    double? pricePerDay,
    String? imageUrl,
    String? category,
    String? transmission,
    String? fuelType,
    int? seats,
    double? rating,
    int? reviews,
    List<String>? features,
    String? description,
    bool? isAvailable,
    String? location,
  }) {
    return Car(
      id: id ?? this.id,
      name: name ?? this.name,
      model: model ?? this.model,
      brand: brand ?? this.brand,
      year: year ?? this.year,
      pricePerDay: pricePerDay ?? this.pricePerDay,
      imageUrl: imageUrl ?? this.imageUrl,
      category: category ?? this.category,
      transmission: transmission ?? this.transmission,
      fuelType: fuelType ?? this.fuelType,
      seats: seats ?? this.seats,
      rating: rating ?? this.rating,
      reviews: reviews ?? this.reviews,
      features: features ?? this.features,
      description: description ?? this.description,
      isAvailable: isAvailable ?? this.isAvailable,
      location: location ?? this.location,
    );
  }
}

