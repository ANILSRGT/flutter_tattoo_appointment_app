import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tattoo_appointment/core/utils/localization/app_langs.dart';

final class LocalizationManager {
  const LocalizationManager._init();
  static const LocalizationManager instance = LocalizationManager._init();

  List<Locale> get supportedLocales =>
      AppLangs.values.map((e) => e.toLocale).toList();

  AppLangs get defaultLang => AppLangs.defaultLang;

  AppLangs currentLang(BuildContext context) {
    final ctxLocale = context.locale;
    final lang = (ctxLocale.countryCode == null)
        ? defaultLang
        : AppLangs.fromString(
            '${ctxLocale.languageCode}_${ctxLocale.countryCode!}',
          );
    return lang;
  }

  void changeLang(BuildContext context, AppLangs lang) {
    final locale = lang.toLocale;
    context.setLocale(locale);
  }
}
