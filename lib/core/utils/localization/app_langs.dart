import 'package:flutter/material.dart';

enum AppLangs {
  enUS(
    langCode: 'en',
    countryCode: 'US',
  ),
  trTR(
    langCode: 'tr',
    countryCode: 'TR',
  );

  const AppLangs({
    required this.langCode,
    required this.countryCode,
  });

  final String langCode;
  final String countryCode;

  static AppLangs get defaultLang => enUS;

  /// [locale] is in the format of ex: 'en_US'
  /// <br> Returns the [AppLangs] enum value for the given language.
  /// <br> If the given language is not found, returns the [defaultLang].
  static AppLangs fromString(String locale) {
    return AppLangs.values.firstWhere(
      (e) => e.toString() == locale,
      orElse: () => defaultLang,
    );
  }
}

extension AppLangsExtension on AppLangs {
  String get fullCode => '${langCode}_$countryCode';
  Locale get toLocale => Locale(langCode, countryCode);
}
