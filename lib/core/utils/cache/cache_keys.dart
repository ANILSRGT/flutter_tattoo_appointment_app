import 'package:flutter/material.dart';

enum CacheKeys<T> {
  isFirstTime<bool>(
    keyName: 'isFirstTime',
  ),
  isThemMode<ThemeMode>(
    keyName: 'isThemeMode',
  );

  const CacheKeys({
    required this.keyName,
  });

  final String keyName;
}
