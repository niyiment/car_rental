
import 'package:car_rental/shared/providers/car_provider.dart';
import 'package:car_rental/shared/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../widgets/car_card.dart';


class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final cars = ref.watch(searchedCarsProvider);
    final categories = ref.watch(categoriesProvider);
    final selectedCategory = ref.watch(selectedCategoryProvider);
    final isDarkMode = ref.watch(themeProvider);

    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'HYUNDAI',
                        style: theme.textTheme.displaySmall?.copyWith(
                          fontSize: 28,
                          letterSpacing: 4,
                        ),
                      ),
                      Text(
                        'Find your perfect ride',
                        style: theme.textTheme.displaySmall?.copyWith(
                          color: theme.textTheme.bodySmall?.color?.withValues(alpha: 0.6),
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () {
                      ref.read(themeProvider.notifier).toggleTheme();
                    },
                    icon: Icon(
                      isDarkMode ? Icons.light_mode : Icons.dark_mode,
                    ),
                    style: IconButton.styleFrom(
                      backgroundColor: theme.cardColor,
                      padding: const EdgeInsets.all(12),
                    ),
                  )
                ],
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                onChanged: (value) => ref.read(searchQueryProvider.notifier).state = value,
                decoration: InputDecoration(
                  hintText: 'Search cars',
                  suffixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 24,),),

          SliverToBoxAdapter(
            child: SizedBox(
              height: 40,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    final category = categories[index];
                    final isSelected = category == selectedCategory;

                    return Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: FilterChip(
                        label: Text(category),
                        selected: isSelected,
                        onSelected: (value) {
                          ref.read(selectedCategoryProvider.notifier).state = category;
                        },
                        checkmarkColor: isDarkMode ? Colors.black : Colors.white,
                        backgroundColor: theme.cardColor,
                        selectedColor: theme.primaryColor,
                        labelStyle: theme.textTheme.bodyMedium?.copyWith(
                          color: isSelected ? theme.cardColor : theme.textTheme.bodyMedium?.color,
                          fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                        ),
                        side: BorderSide.none,
                      ),
                    );
                  }
              ),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 24,),),

          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.75,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              delegate: SliverChildBuilderDelegate(
                    (context, index) {
                  final car = cars[index];
                  return CarCard(car: car,);
                },
                childCount: cars.length,
              ),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 20,),),
        ],
      ),
    );
  }
}
