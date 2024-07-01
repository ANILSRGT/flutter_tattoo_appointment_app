import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:tattoo_appointment/core/utils/cache/cache_manager.dart';
import 'package:tattoo_appointment/core/utils/cache/caches/hive_cache.dart';
import 'package:tattoo_appointment/core/utils/cache/icache.dart';
import 'package:tattoo_appointment/core/utils/router/app_router.dart';
import 'package:tattoo_appointment/core/utils/router/inav.dart';
import 'package:tattoo_appointment/core/utils/router/routes/material_nav.dart';
import 'package:tattoo_appointment/data/data_sources/auth/local/auth_local_data_source.dart';
import 'package:tattoo_appointment/data/data_sources/auth/local/iauth_local_data_source.dart';
import 'package:tattoo_appointment/data/data_sources/auth/remote/auth_remote_data_source.dart';
import 'package:tattoo_appointment/data/data_sources/auth/remote/iauth_remote_data_source.dart';
import 'package:tattoo_appointment/data/models/auth_model.dart';
import 'package:tattoo_appointment/data/repositories/auth/auth_repo.dart';
import 'package:tattoo_appointment/domain/repositories/auth/iauth_repo.dart';
import 'package:tattoo_appointment/domain/usecases/auth/auth_current_user_usecase.dart';
import 'package:tattoo_appointment/domain/usecases/auth/auth_sign_in_with_email_password_usecase.dart';
import 'package:tattoo_appointment/domain/usecases/auth/auth_sign_out_usecase.dart';
import 'package:tattoo_appointment/domain/usecases/auth/auth_sign_up_with_email_password_usecase.dart';
import 'package:tattoo_appointment/domain/usecases/auth/auth_user_changes_usecase.dart';

final class Injection {
  static final GetIt _getIt = GetIt.instance;

  static Future<void> registerDependencies() async {
    final navigatorKey = GlobalKey<NavigatorState>();
    final firebaseAuth = FirebaseAuth.instance;

    final ICache cache = HiveCache();

    //~ Core
    await _getIt
        .registerSingleton<CacheManager>(CacheManager(cache: cache))
        .init();

    _getIt
      //~ Data Sources
      ..registerSingleton<IAuthLocalDataSource>(
        AuthLocalDataSource(cacheManager: _getIt<CacheManager>()),
      )
      ..registerSingleton<IAuthRemoteDataSource>(
        AuthRemoteDataSource(firebaseAuth: firebaseAuth),
      )
      //~ Repositories
      ..registerSingleton<IAuthRepo>(
        AuthRepo(
          localDataSource: _getIt<IAuthLocalDataSource>(),
          remoteDataSource: _getIt<IAuthRemoteDataSource>(),
        ),
      )
      //~ Use Cases
      ..registerSingleton<AuthSignUpWithEmailPasswordUseCase>(
        AuthSignUpWithEmailPasswordUseCase(authRepo: _getIt<IAuthRepo>()),
      )
      ..registerSingleton<AuthSignInWithEmailPasswordUseCase>(
        AuthSignInWithEmailPasswordUseCase(authRepo: _getIt<IAuthRepo>()),
      )
      ..registerSingleton<AuthSignOutUseCase>(
        AuthSignOutUseCase(authRepo: _getIt<IAuthRepo>()),
      )
      ..registerSingleton<AuthUserChangesUseCase>(
        AuthUserChangesUseCase(authRepo: _getIt<IAuthRepo>()),
      )
      ..registerSingleton<AuthCurrentUserUseCase>(
        AuthCurrentUserUseCase(authRepo: _getIt<IAuthRepo>()),
      )
      //~ Routes
      ..registerSingleton<GlobalKey<NavigatorState>>(navigatorKey)
      ..registerSingleton<INav>(
        MaterialNav(navigatorKey: _getIt<GlobalKey<NavigatorState>>()),
      );
    await _getIt
        .registerSingleton<AppRouter>(
          AppRouter(
            authenticatedUser: _authenticatedUser,
            navigator: _getIt(),
          ),
        )
        .init();
  }

  static T read<T extends Object>() => _getIt.get<T>();

  static Stream<AuthModel?> get _authenticatedUser =>
      _getIt<AuthUserChangesUseCase>().execute().map((user) {
        return user == null ? null : AuthModel.fromEntity(user);
      });
}
