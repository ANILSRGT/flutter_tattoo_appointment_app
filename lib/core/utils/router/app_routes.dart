import 'package:flutter/material.dart';
import 'package:tattoo_appointment/core/utils/router/guards/route_guard_types.dart';
import 'package:tattoo_appointment/presentation/pages/auth/auth_page.dart';
import 'package:tattoo_appointment/presentation/pages/onboarding/onboarding_page.dart';
import 'package:tattoo_appointment/presentation/pages/splash/splash_page.dart';

enum AppRoutes {
  notFound(
    path: '/notFound',
    page: Scaffold(
      body: Center(
        child: Text('Not Found'),
      ),
    ),
  ),
  splash(
    path: '/splash',
    page: SplashPage(),
  ),
  onboarding(
    path: '/onboarding',
    page: OnBoardingPage(),
  ),
  auth(
    path: '/auth',
    page: AuthPage(),
  ),
  home(
    path: '/home',
    page: Scaffold(
      body: Center(
        child: Text('Home'),
      ),
    ),
    guards: [RouteGuardTypes.auth],
  );

  const AppRoutes({
    required this.path,
    required this.page,
    this.guards = const [],
  });

  final String path;
  final Widget page;
  final List<RouteGuardTypes> guards;

  static String get initialRoute => AppRoutes.splash.path;

  static AppRoutes fromString(String? path) {
    if (path == null) return AppRoutes.notFound;

    return AppRoutes.values.firstWhere(
      (route) => route.path == path,
      orElse: () => AppRoutes.notFound,
    );
  }
}
