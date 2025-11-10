import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../features/welcome/presentation/welcome_screen.dart';

class AppRouter {
  static const String welcome = '/welcome';
  static const String home = '/home';

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
        path: AppRouter.home,
        name: 'home',
        pageBuilder: (context, state) => CustomTransitionPage(
            key: state.pageKey,
            child: const Placeholder(),
            transitionsBuilder: (context, animation, secondaryAnimation, child) => FadeTransition(
              opacity: animation,
              child: child,
            )
        ),
      ),
    ],
    errorBuilder: (context, state) => const Scaffold(
      body: Center(
        child: Text('Something went wrong!'),
      ),
    ),
  );
});
