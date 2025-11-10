
import 'package:car_rental/features/rent/presentation/screen/main_layout_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../features/rent/presentation/screen/car_detail_screen.dart';
import '../../features/welcome/presentation/welcome_screen.dart';

class AppRouter {
  static const String welcome = '/welcome';
  static const String mainLayout = '/main';
  static const String detail = '/detail';
}

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: AppRouter.welcome,
    routes: [
      GoRoute(
        path: AppRouter.welcome,
        name: 'welcome',
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const WelcomeScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) => FadeTransition(
            opacity: animation,
            child: child,
          )
        ),
      ),
      GoRoute(
        path: AppRouter.mainLayout,
        name: 'main',
        pageBuilder: (context, state) => CustomTransitionPage(
            key: state.pageKey,
            child: const MainLayoutScreen(),
            transitionsBuilder: (context, animation, secondaryAnimation, child) => FadeTransition(
              opacity: animation,
              child: child,
            )
        ),
      ),
      GoRoute(
        path: '${AppRouter.mainLayout}/:id',
        name: 'detail',
        pageBuilder: (context, state) {
          final carId = state.pathParameters['id']!;

          return CustomTransitionPage(
            key: state.pageKey,
            child: DetailScreen(carId: carId),
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              const begin = Offset(1.0, 0.0);
              const end = Offset.zero;
              const curve = Curves.easeInOut;
              final tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

              return SlideTransition(
                position: animation.drive(tween),
                child: child,
              );
            }
          );
        }
      ),
    ],
    errorBuilder: (context, state) => const Scaffold(
      body: Center(
        child: Text('Something went wrong!'),
      ),
    ),
  );
});
