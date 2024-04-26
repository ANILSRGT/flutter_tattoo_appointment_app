import 'package:flutter/material.dart';
import 'package:tattoo_appointment/core/utils/router/guards/route_guard_types.dart';
import 'package:tattoo_appointment/presentation/pages/auth/auth_page.dart';
import 'package:tattoo_appointment/presentation/pages/splash/splash_page.dart';

enum AppRoutes {
  splash(
    path: '/splash',
    page: SplashPage(),
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
  ),
  notFound(
    path: '/not-found',
    page: Scaffold(
      body: Center(
        child: Text('Not Found'),
      ),
    ),
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

  static AppRoutes fromString(String path) {
    for (var route in AppRoutes.values) {
      if (route.path == path) {
        return route;
      }
    }

    return AppRoutes.notFound;
  }
}
