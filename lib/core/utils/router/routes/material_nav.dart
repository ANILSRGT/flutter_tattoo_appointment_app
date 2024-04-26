import 'package:flutter/material.dart';
import 'package:tattoo_appointment/core/utils/router/app_routes.dart';
import 'package:tattoo_appointment/core/utils/router/inav.dart';

final class MaterialNav implements INav {
  const MaterialNav({
    required this.navigatorKey,
  });

  final GlobalKey<NavigatorState> navigatorKey;

  @override
  Future<void> init() async {}

  @override
  void pop<T extends Object?>([T? result]) {
    return navigatorKey.currentState?.pop(result);
  }

  @override
  Future<T?> navigateTo<T extends Object?>(
    AppRoutes route, {
    Object? arguments,
  }) {
    return navigatorKey.currentState?.pushNamed(
          route.path,
          arguments: arguments,
        ) ??
        Future.value();
  }

  @override
  Future<T?> navigateToClear<T extends Object?>(
    AppRoutes route, {
    Object? arguments,
  }) {
    return navigatorKey.currentState?.pushNamedAndRemoveUntil(
          route.path,
          (_) => false,
          arguments: arguments,
        ) ??
        Future.value();
  }

  @override
  Future<T?> navigateToAndRemoveUntilRoot<T extends Object?>(
    AppRoutes route, {
    Object? arguments,
  }) {
    return navigatorKey.currentState?.pushNamedAndRemoveUntil(
          route.path,
          (r) => r.isFirst,
          arguments: arguments,
        ) ??
        Future.value();
  }

  @override
  Future<T?> navigateToReplace<T extends Object?, TO extends Object?>(
    AppRoutes route, {
    TO? result,
    Object? arguments,
  }) {
    return navigatorKey.currentState?.pushReplacementNamed(
          route.path,
          result: result,
          arguments: arguments,
        ) ??
        Future.value();
  }
}
