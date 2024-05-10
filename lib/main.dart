import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tattoo_appointment/app.dart';
import 'package:tattoo_appointment/core/constants/app/app_constants.dart';
import 'package:tattoo_appointment/core/utils/localization/app_langs.dart';
import 'package:tattoo_appointment/core/utils/localization/localization_manager.dart';
import 'package:tattoo_appointment/injection.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // System Chrome settings
  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  );
  await SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.immersiveSticky,
    overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom],
  );

  // Register Google Fonts licenses
  LicenseRegistry.addLicense(() async* {
    final license = await rootBundle.loadString('assets/fonts/lato/OFL.txt');
    yield LicenseEntryWithLineBreaks(['google_fonts'], license);
  });

  // Register dependencies
  await EasyLocalization.ensureInitialized();
  await Injection.registerDependencies();

  runApp(
    EasyLocalization(
      supportedLocales: LocalizationManager.instance.supportedLocales,
      path: AppConstants.translationsPath,
      fallbackLocale: LocalizationManager.instance.defaultLang.toLocale,
      child: const MainApp(),
    ),
  );
}
