import 'package:tattoo_appointment/core/utils/cache/cache_keys.dart';

abstract interface class ICache {
  Stream<T?> listen<T>(CacheKeys<T> key);
  Future<void> init();
  Future<void> set<T>(CacheKeys<T> key, T value);
  T? get<T>(CacheKeys<T> key, {T? defaultValue});
  Future<void> delete<T>(CacheKeys<T> key);
  void clear();
}
