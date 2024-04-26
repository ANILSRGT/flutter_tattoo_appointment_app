import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:tattoo_appointment/core/utils/theme/app_color.dart';
import 'package:tattoo_appointment/core/utils/theme/itheme.dart';
import 'package:tattoo_appointment/core/utils/theme/theme_color.dart';

final class MainTheme implements ITheme {
  const MainTheme();

  @override
  AppColor get appColor => const AppColor(
        primary: ThemeColor(
          color: Colors.amber,
          onColor: Colors.black,
        ),
      );

  @override
  ThemeData get lightTheme => _defaultTheme(isDark: false);

  @override
  ThemeData get darkTheme => _defaultTheme(isDark: true);

  ThemeData _defaultTheme({
    required bool isDark,
  }) {
    final data = isDark
        ? ThemeData.light(useMaterial3: true)
        : ThemeData.dark(useMaterial3: true);
    return data.copyWith(
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: appColor.primary.color.ext.material.toMaterialColor,
      ),
    );
  }
}
