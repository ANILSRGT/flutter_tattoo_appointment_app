import 'package:tattoo_appointment/core/utils/cache/cache_manager.dart';
import 'package:tattoo_appointment/data/data_sources/auth/local/iauth_local_data_source.dart';

final class AuthLocalDataSource implements IAuthLocalDataSource {
  AuthLocalDataSource({
    required CacheManager cacheManager,
  }) : _cacheManager = cacheManager;

  // ignore: unused_field
  final CacheManager _cacheManager;
}
