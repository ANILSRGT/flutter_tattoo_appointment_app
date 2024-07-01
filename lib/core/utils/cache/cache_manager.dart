import 'package:tattoo_appointment/core/utils/cache/cache_keys.dart';
import 'package:tattoo_appointment/core/utils/cache/icache.dart';

final class CacheManager {
  const CacheManager({
    required ICache cache,
  }) : _cache = cache;

  final ICache _cache;

  Future<void> init() async {
    await _cache.init();
  }

  void clear() {
    _cache.clear();
  }

  Future<void> delete<T>(CacheKeys<T> key) {
    return _cache.delete(key);
  }

  T? get<T>(CacheKeys<T> key, {T? defaultValue}) {
    return _cache.get(key, defaultValue: defaultValue);
  }

  Future<void> set<T>(CacheKeys<T> key, T value) {
    return _cache.set(key, value);
  }

  Stream<T?> listen<T>(CacheKeys<T> key) {
    return _cache.listen(key);
  }
}
