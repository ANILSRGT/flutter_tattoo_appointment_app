import 'package:flutter/material.dart';
import 'package:tattoo_appointment/core/utils/router/app_routes.dart';
import 'package:tattoo_appointment/core/utils/router/auth_guard.dart';
import 'package:tattoo_appointment/core/utils/router/inav.dart';
import 'package:tattoo_appointment/data/models/auth_model.dart';

final class AppRouter {
  const AppRouter({
    required this.authenticatedUser,
    required INav navigator,
  }) : _navigator = navigator;

  final Stream<AuthModel?> authenticatedUser;
  final INav _navigator;

  Future<void> init() async {
    return _navigator.init();
  }

  String get initialRoute => AppRoutes.initialRoute;

  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final route = AppRoutes.fromString(settings.name);

    return _navigate(route, arguments: settings.arguments);
  }

  MaterialPageRoute<dynamic> _navigate(AppRoutes route, {Object? arguments}) {
    return MaterialPageRoute(
      settings: RouteSettings(
        name: route.path,
        arguments: arguments,
      ),
      builder: (_) {
        return AuthGuard(
          hasAuthGuard: route.hasAuthGuard,
          authenticatedUser: authenticatedUser,
          child: route.page,
        );
      },
    );
  }

  void pop<T extends Object?>([T? result]) => _navigator.pop(result);

  Future<T?> navigateTo<T extends Object?>(
    AppRoutes route, {
    Object? arguments,
  }) async {
    return _navigator.navigateTo(route, arguments: arguments);
  }

  Future<T?> navigateToClear<T extends Object?>(
    AppRoutes route, {
    Object? arguments,
  }) async {
    return _navigator.navigateToClear(route, arguments: arguments);
  }

  Future<T?> navigateToAndRemoveUntilRoot<T extends Object?>(
    AppRoutes route, {
    Object? arguments,
  }) async {
    return _navigator.navigateToAndRemoveUntilRoot(route, arguments: arguments);
  }

  Future<T?> navigateToReplace<T extends Object?, TO extends Object?>(
    AppRoutes route, {
    TO? result,
    Object? arguments,
  }) async {
    return _navigator.navigateToReplace(
      route,
      result: result,
      arguments: arguments,
    );
  }
}
