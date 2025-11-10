
import 'package:car_rental/shared/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../widgets/profile_option.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final isDarkMode = ref.watch(themeProvider);

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Profile',
              style: theme.textTheme.displaySmall,
            ),
            const SizedBox(height: 32),

            // Profile Header
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: theme.cardColor,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: theme.primaryColor,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.person_rounded,
                      size: 36,
                      color: isDarkMode ? Colors.black : Colors.white,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Niyi',
                          style: theme.textTheme.titleLarge,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'info@niyogentic.com',
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: theme.textTheme.bodySmall?.color?.withOpacity(0.6),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Settings Options
            ProfileOption(
              icon: Icons.notifications_rounded,
              title: 'Notifications',
              onTap: () {},
            ),
            ProfileOption(
              icon: Icons.payment_rounded,
              title: 'Payment Methods',
              onTap: () {},
            ),
            ProfileOption(
              icon: isDarkMode ? Icons.light_mode_rounded : Icons.dark_mode_rounded,
              title: isDarkMode ? 'Light Mode' : 'Dark Mode',
              onTap: () {
                ref.read(themeProvider.notifier).toggleTheme();
              },
            ),
            ProfileOption(
              icon: Icons.help_rounded,
              title: 'Help & Support',
              onTap: () {},
            ),
            ProfileOption(
              icon: Icons.info_rounded,
              title: 'About',
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
