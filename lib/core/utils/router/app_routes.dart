import 'package:flutter/material.dart';
import 'package:tattoo_appointment/presentation/pages/appointments/appointments_page.dart';
import 'package:tattoo_appointment/presentation/pages/auth/auth_page.dart';
import 'package:tattoo_appointment/presentation/pages/home/home_main_page.dart';
import 'package:tattoo_appointment/presentation/pages/onboarding/onboarding_page.dart';
import 'package:tattoo_appointment/presentation/pages/profile/profile_page.dart';
import 'package:tattoo_appointment/presentation/pages/splash/splash_page.dart';

enum AppRoutes {
  notFound(
    path: '/notFound',
    hasAuthGuard: false,
    page: Scaffold(
      body: Center(
        child: Text('Not Found'),
      ),
    ),
  ),
  splash(
    path: '/splash',
    hasAuthGuard: false,
    page: SplashPage(),
  ),
  onboarding(
    path: '/onboarding',
    hasAuthGuard: false,
    page: OnBoardingPage(),
  ),
  auth(
    path: '/auth',
    hasAuthGuard: false,
    page: AuthPage(),
  ),
  home(
    path: '/home',
    hasAuthGuard: true,
    page: HomeMainPage(),
  ),
  appointments(
    path: '/appointments',
    hasAuthGuard: true,
    page: AppointmentsPage(),
  ),
  profile(
    path: '/profile',
    hasAuthGuard: true,
    page: ProfilePage(),
  );

  const AppRoutes({
    required this.path,
    required this.page,
    required this.hasAuthGuard,
  });

  final String path;
  final Widget page;
  final bool hasAuthGuard;

  static String get initialRoute => AppRoutes.splash.path;

  static AppRoutes fromString(String? path) {
    if (path == null) return AppRoutes.notFound;

    return AppRoutes.values.firstWhere(
      (route) => route.path == path,
      orElse: () => AppRoutes.notFound,
    );
  }
}
