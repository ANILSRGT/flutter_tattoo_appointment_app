import 'package:flutter/material.dart';
import 'package:tattoo_appointment/core/utils/router/app_routes.dart';

final class AppRouter {
  static const AppRouter instance = AppRouter._init();
  const AppRouter._init();

  String get initialRoute => AppRoutes.initialRoute;

  Route onGenerateRoute(RouteSettings settings) {
    final route = AppRoutes.fromString(settings.name!);

    return _navigate(route, arguments: settings.arguments);
  }

  MaterialPageRoute<dynamic> _navigate(AppRoutes route, {Object? arguments}) {
    return MaterialPageRoute(
      settings: RouteSettings(
        name: route.path,
        arguments: arguments,
      ),
      builder: (_) => route.page,
    );
  }
}
