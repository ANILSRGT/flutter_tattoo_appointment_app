import 'package:tattoo_appointment/core/utils/router/app_routes.dart';

abstract interface class INav {
  Future<void> init();

  void pop<T extends Object?>([T? result]);

  Future<T?> navigateTo<T extends Object?>(
    AppRoutes route, {
    Object? arguments,
  });

  Future<T?> navigateToClear<T extends Object?>(
    AppRoutes route, {
    Object? arguments,
  });

  Future<T?> navigateToAndRemoveUntilRoot<T extends Object?>(
    AppRoutes route, {
    Object? arguments,
  });

  Future<T?> navigateToReplace<T extends Object?, TO extends Object?>(
    AppRoutes route, {
    TO? result,
    Object? arguments,
  });
}
