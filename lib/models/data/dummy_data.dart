
import 'package:car_rental/core/constants/app_string.dart';

import '../car.dart';

class DummyData {
  static final List<Car> cars = [
    const Car(
      id: '1',
      name: 'Hyundai Elantra',
      model: 'Elantra 2025',
      year: 2025,
      pricePerDay: 45.0,
      imageUrl: AppConstant.elantra,
      category: 'Sedan',
      transmission: 'Automatic',
      fuelType: 'Hybrid',
      seats: 5,
      rating: 4.8,
      reviews: 234,
      features: [
        'Apple CarPlay',
        'Android Auto',
        'Lane Keep Assist',
        'Blind Spot Detection',
        'Heated Seats',
        'Sunroof',
      ],
      description:
          'The Hyundai Elantra combines sleek design with advanced technology. Perfect for city driving and long trips with excellent fuel efficiency.',
      isAvailable: true,
      location: 'Downtown Branch',
    ),
    const Car(
      id: '2',
      name: 'Hyundai Tucson',
      model: 'Tucson 2025',
      year: 2025,
      pricePerDay: 65.0,
      imageUrl: AppConstant.tucson,
      category: 'SUV',
      transmission: 'Automatic',
      fuelType: 'Hybrid',
      seats: 5,
      rating: 4.9,
      reviews: 456,
      features: [
        'All-Wheel Drive',
        '360° Camera',
        'Wireless Charging',
        'Smart Cruise Control',
        'Premium Sound System',
        'Panoramic Sunroof',
      ],
      description:
          'Experience luxury and performance with the Hyundai Tucson. Spacious interior, cutting-edge safety features, and impressive handling.',
      isAvailable: true,
      location: 'Airport Branch',
    ),
    const Car(
      id: '3',
      name: 'Hyundai Sonata',
      model: 'Sonata N Line 2025',
      year: 2025,
      pricePerDay: 55.0,
      imageUrl: AppConstant.sonata,
      category: 'Sedan',
      transmission: 'Automatic',
      fuelType: 'Gasoline',
      seats: 5,
      rating: 4.7,
      reviews: 189,
      features: [
        'Sport Mode',
        'LED Headlights',
        'Premium Interior',
        'Digital Key',
        'Bose Sound System',
        'Ventilated Seats',
      ],
      description:
          'The Sonata N Line delivers sporty performance with refined comfort. Ideal for those who want style and substance.',
      isAvailable: true,
      location: 'City Center Branch',
    ),
    const Car(
      id: '4',
      name: 'Hyundai Palisade',
      model: 'Palisade Calligraphy 2025',
      year: 2025,
      pricePerDay: 85.0,
      imageUrl: AppConstant.palisade,
      category: 'SUV',
      transmission: 'Automatic',
      fuelType: 'Gasoline',
      seats: 7,
      rating: 4.9,
      reviews: 523,
      features: [
        'Three-Row Seating',
        'Nappa Leather',
        'Highway Driving Assist',
        'Heads-Up Display',
        'Dual Sunroof',
        'Premium Audio',
      ],
      description:
          'The flagship Palisade offers unmatched luxury and space. Perfect for family adventures with premium comfort for all passengers.',
      isAvailable: true,
      location: 'Premium Branch',
    ),
    const Car(
      id: '5',
      name: 'Hyundai Kona',
      model: 'Kona 2025',
      year: 2025,
      pricePerDay: 60.0,
      imageUrl: AppConstant.kona,
      category: 'Compact SUV',
      transmission: 'Automatic',
      fuelType: 'Gasoline',
      seats: 5,
      rating: 4.8,
      reviews: 312,
      features: [
        'Three-Row Seating',
        'Nappa Leather',
        'Highway Driving Assist',
        'Heads-Up Display',
        'Dual Sunroof',
        'Premium Audio',
      ],
      description:
          'Ideal for those who want style and substance.',
      isAvailable: true,
      location: 'Downtown Branch',
    ),
    const Car(
      id: '6',
      name: 'Hyundai Santa Fe',
      model: 'Santa Fe Hybrid 2025',
      year: 2025,
      pricePerDay: 70.0,
      imageUrl: AppConstant.santafe,
      category: 'SUV',
      transmission: 'Automatic',
      fuelType: 'Hybrid',
      seats: 7,
      rating: 4.8,
      reviews: 401,
      features: [
        'Hybrid Efficiency',
        'Captain\'s Chairs',
        'Remote Start',
        'Wireless CarPlay',
        'Power Liftgate',
        'Climate Control',
      ],
      description:
          'The Santa Fe Hybrid combines versatility with efficiency. Spacious, comfortable, and perfect for weekend getaways.',
      isAvailable: false,
      location: 'Airport Branch',
    ),
    const Car(
      id: '7',
      name: 'Hyundai Venue',
      model: 'Venue 2025',
      year: 2025,
      pricePerDay: 35.0,
      imageUrl: AppConstant.venue,
      category: 'Compact SUV',
      transmission: 'Automatic',
      fuelType: 'Gasoline',
      seats: 5,
      rating: 4.6,
      reviews: 178,
      features: [
        'Compact Design',
        'Fuel Efficient',
        'Smartphone Integration',
        'Rearview Camera',
        'Easy Parking',
        'Modern Interior',
      ],
      description:
          'The Venue is perfect for urban adventures. Compact, nimble, and packed with features at an affordable price.',
      isAvailable: true,
      location: 'City Center Branch',
    ),
    const Car(
      id: '8',
      name: 'Hyundai Ioniq 6',
      model: 'Ioniq 6 2025',
      year: 2025,
      pricePerDay: 75.0,
      imageUrl: AppConstant.ioniq6,
      category: 'Sedan',
      transmission: 'Automatic',
      fuelType: 'Electric',
      seats: 5,
      rating: 4.9,
      reviews: 267,
      features: [
        'Futuristic Design',
        '350+ Mile Range',
        'Ultra-Fast Charging',
        'Augmented Reality HUD',
        'Relaxation Seats',
        'Vehicle-to-Load',
      ],
      description:
          'Experience the future with the Ioniq 6. Stunning aerodynamic design meets cutting-edge electric technology.',
      isAvailable: true,
      location: 'Premium Branch',
    ),
  ];

  static List<String> get categories {
    return cars.map((car) => car.category).toSet().toList();
  }

  static List<Car> getCarsByCategory(String category) {
    if (category.toLowerCase() == 'all') return cars;
    return cars.where((car) => car.category == category).toList();
  }

  static Car? getCarById(String id) {
    try {
      return cars.firstWhere((car) => car.id == id);
    } catch (e) {
      return null;
    }
  }
}

