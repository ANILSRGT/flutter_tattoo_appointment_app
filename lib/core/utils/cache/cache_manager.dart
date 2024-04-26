import 'package:tattoo_appointment/core/utils/cache/cache_keys.dart';
import 'package:tattoo_appointment/core/utils/cache/icache.dart';

final class CacheManager {
  const CacheManager({
    required this.cache,
  });

  final ICache cache;

  Future<void> init() async {
    await cache.init();
  }

  void clear() {
    cache.clear();
  }

  Future<void> delete<T>(CacheKeys<T> key) {
    return cache.delete(key);
  }

  T? get<T>(CacheKeys<T> key, {T? defaultValue}) {
    return cache.get(key, defaultValue: defaultValue);
  }

  Future<void> set<T>(CacheKeys<T> key, T value) {
    return cache.set(key, value);
  }
}
