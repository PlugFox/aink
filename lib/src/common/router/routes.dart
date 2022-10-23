import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../feature/gallery/widget/gallery_screen.dart';
import '../../feature/promt/widget/promt_screen.dart';
import '../../feature/settings/widget/settings_screen.dart';
import '../../feature/wheel/widget/wheel_screen.dart';

final List<GoRoute> $routes = <GoRoute>[
  GoRoute(
    name: 'Home',
    path: '/',
    redirect: (context, state) => state.namedLocation(
      'Wheel',
      params: state.params,
      queryParams: state.queryParams,
    ),
  ),
  GoRoute(
    name: 'Wheel',
    path: '/tabs',
    builder: (context, state) => const WheelScreen(),
    routes: <RouteBase>[
      GoRoute(
        name: 'Gallery',
        path: 'gallery',
        builder: (context, state) => const GalleryScreen(),
      ),
      GoRoute(
        name: 'Promt',
        path: 'promt',
        pageBuilder: (context, state) => CustomTransitionPage<void>(
          child: const PromtScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) => ScaleTransition(
            scale: Tween<double>(begin: 1.25, end: 1).animate(animation),
            child: FadeTransition(
              opacity: animation.drive(CurveTween(curve: Curves.easeIn)),
              child: child,
            ),
          ),
        ),
      ),
      GoRoute(
        name: 'Settings',
        path: 'settings',
        pageBuilder: (context, state) => CustomTransitionPage<void>(
          child: const SettingsScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) => ScaleTransition(
            scale: Tween<double>(begin: 1.25, end: 1).animate(animation),
            child: FadeTransition(
              opacity: animation.drive(CurveTween(curve: Curves.easeIn)),
              child: child,
            ),
          ),
        ),
      ),
    ],
  ),
];

extension GoRoutesExtension on BuildContext {
  GoRouter get _router => GoRouter.of(this);

  void pop() => _router.pop();

  /// Navigate to the Home route.
  void goHome() => _router.goNamed('Home');

  /// Navigate to the [WheelScreen].
  void goTabs() => _router.goNamed('Wheel');

  /// Navigate to the [GalleryScreen].
  void goGallery() => _router.goNamed('Gallery');

  /// Navigate to the [PromtScreen].
  void goPromt() => _router.goNamed('Promt');

  /// Navigate to the [SettingsScreen].
  void goSettings() => _router.goNamed('Settings');
}
