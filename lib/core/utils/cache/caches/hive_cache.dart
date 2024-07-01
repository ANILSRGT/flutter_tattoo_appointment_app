import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as pathpro;
import 'package:tattoo_appointment/core/utils/cache/cache_keys.dart';
import 'package:tattoo_appointment/core/utils/cache/icache.dart';

final class HiveCache implements ICache {
  late final Box<dynamic> box;

  @override
  Future<void> init() async {
    if (!kIsWeb) {
      final appDocumentDir = await pathpro.getApplicationDocumentsDirectory();
      Hive.init(appDocumentDir.path);
    }

    box = await Hive.openBox('cache');
  }

  @override
  void clear() {
    box.clear();
  }

  @override
  Future<void> delete<T>(CacheKeys<T> key) {
    return box.delete(key.keyName);
  }

  @override
  T? get<T>(CacheKeys<T> key, {T? defaultValue}) {
    return box.get(key.keyName, defaultValue: defaultValue) as T?;
  }

  @override
  Future<void> set<T>(CacheKeys<T> key, T value) {
    return box.put(key.keyName, value);
  }

  @override
  Stream<T?> listen<T>(CacheKeys<T> key) {
    return box.watch(key: key.keyName).map((event) => event.value as T?);
  }
}
