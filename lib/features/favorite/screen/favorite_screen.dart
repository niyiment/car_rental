import 'package:car_rental/shared/providers/car_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../widgets/favorite_car_card.dart';


class FavoritesScreen extends ConsumerWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final favouriteCars = ref.watch(favoritesCarsProvider);

    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                'Favorites',
                style: theme.textTheme.displaySmall,
              ),
            ),
          ),

          if (favouriteCars.isEmpty)
            SliverFillRemaining(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.favorite_border_rounded,
                      color: theme.textTheme.bodySmall?.color?.withValues(alpha: 0.3),
                      size: 64,
                    ),
                    const SizedBox(height: 16,),
                    Text(
                      'No favorites yet',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.textTheme.bodySmall?.color?.withValues(alpha: 0.5),
                      )
                    ),
                  ],
                ),
              ),
            )
          else
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final car = favouriteCars[index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: FavoriteCarCard(car: car),
                      );
                    },
                    childCount: favouriteCars.length,
                  ),
              ),
            ),
        ],
      ),
    );
  }
}

