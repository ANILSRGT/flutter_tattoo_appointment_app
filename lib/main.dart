import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tattoo_appointment/app.dart';
import 'package:tattoo_appointment/core/constants/app/app_constants.dart';
import 'package:tattoo_appointment/core/utils/localization/app_langs.dart';
import 'package:tattoo_appointment/core/utils/localization/localization_manager.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(EasyLocalization(
    supportedLocales: LocalizationManager.instance.supportedLocales,
    path: AppConstants.translationsPath,
    fallbackLocale: LocalizationManager.instance.defaultLang.toLocale,
    child: const MainApp(),
  ));
}
