import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:tattoo_appointment/core/utils/cache/cache_manager.dart';
import 'package:tattoo_appointment/core/utils/cache/caches/hive_cache.dart';
import 'package:tattoo_appointment/core/utils/cache/icache.dart';
import 'package:tattoo_appointment/core/utils/router/app_router.dart';
import 'package:tattoo_appointment/core/utils/router/inav.dart';
import 'package:tattoo_appointment/core/utils/router/routes/material_nav.dart';

final class Injection {
  static final GetIt _getIt = GetIt.instance;

  static Future<void> registerDependencies() async {
    final navigatorKey = GlobalKey<NavigatorState>();

    //~ Routes
    _getIt
      ..registerSingleton<GlobalKey<NavigatorState>>(navigatorKey)
      ..registerSingleton<INav>(MaterialNav(navigatorKey: _getIt()));
    await _getIt
        .registerSingleton<AppRouter>(
          AppRouter(
            // TODO: Authenticated check stream
            isAuthenticated: Stream.value(false),
            navigator: _getIt(),
          ),
        )
        .init();
    //~ Cache
    _getIt.registerSingleton<ICache>(HiveCache());
    await _getIt
        .registerSingleton<CacheManager>(CacheManager(cache: _getIt()))
        .init();
  }

  static T read<T extends Object>() => _getIt.get<T>();
}
