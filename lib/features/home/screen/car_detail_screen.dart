
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../shared/providers/car_provider.dart';
import '../widgets/car_detail_content.dart';

class DetailScreen extends ConsumerWidget {
  final String carId;

  const DetailScreen({
    super.key,
    required this.carId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final car = ref.watch(carByIdProvider(carId));

    if (car == null) {
      return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_rounded),
            onPressed: () => context.pop(),
          ),
        ),
        body: const Center(
          child: Text('Car not found'),
        ),
      );
    }

    return DetailContentWidget(car: car);
  }
}

