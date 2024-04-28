import 'package:flutter/material.dart';
import 'package:tattoo_appointment/core/utils/theme/app_color.dart';
import 'package:tattoo_appointment/core/utils/theme/itheme.dart';
import 'package:tattoo_appointment/core/utils/theme/theme_color.dart';

final class MainTheme implements ITheme {
  const MainTheme();

  @override
  AppColor get appColor => const AppColor(
        background: ThemeColor(
          color: Color(0xFFFBFBFB),
          onColor: Color(0xFF1D1D1D),
        ),
        primary: ThemeColor(
          color: Color(0xFF621EC1),
          onColor: Color(0xFFFBFBFB),
        ),
        secondary: ThemeColor(
          color: Color(0xFFB41EC1),
          onColor: Color(0xFFFBFBFB),
        ),
        tertiary: ThemeColor(
          color: Color(0xFF7DC11E),
          onColor: Color(0xFFFBFBFB),
        ),
        error: ThemeColor(
          color: Color(0xFFC11E1E),
          onColor: Color(0xFFFBFBFB),
        ),
        success: ThemeColor(
          color: Color(0xFF1EC17D),
          onColor: Color(0xFFFBFBFB),
        ),
        grey: ThemeColor(
          color: Color(0xFFBDBDBD),
          onColor: Color(0xFF1D1D1D),
        ),
      );

  @override
  ThemeData get lightTheme => _defaultTheme(isDark: false);

  @override
  ThemeData get darkTheme => _defaultTheme(isDark: true);

  ThemeData _defaultTheme({
    required bool isDark,
  }) {
    var data = isDark
        ? ThemeData.light(useMaterial3: true)
        : ThemeData.dark(useMaterial3: true);
    data = data.copyWith(
      textTheme: data.textTheme
          .copyWith(
            displayLarge: data.textTheme.displayLarge?.copyWith(
              fontSize: 57,
            ),
            displayMedium: data.textTheme.displayMedium?.copyWith(
              fontSize: 45,
            ),
            displaySmall: data.textTheme.displaySmall?.copyWith(
              fontSize: 36,
            ),
            headlineLarge: data.textTheme.headlineLarge?.copyWith(
              fontSize: 32,
            ),
            headlineMedium: data.textTheme.headlineMedium?.copyWith(
              fontSize: 28,
            ),
            headlineSmall: data.textTheme.headlineSmall?.copyWith(
              fontSize: 24,
            ),
            titleLarge: data.textTheme.titleLarge?.copyWith(
              fontSize: 22,
              fontWeight: FontWeight.w500,
            ),
            titleMedium: data.textTheme.titleMedium?.copyWith(
              fontSize: 16,
              letterSpacing: 0.15,
              fontWeight: FontWeight.w500,
            ),
            titleSmall: data.textTheme.titleSmall?.copyWith(
              fontSize: 14,
              letterSpacing: 0.1,
              fontWeight: FontWeight.w500,
            ),
            labelLarge: data.textTheme.labelLarge?.copyWith(
              fontSize: 14,
              letterSpacing: 0.1,
              fontWeight: FontWeight.w500,
            ),
            labelMedium: data.textTheme.labelMedium?.copyWith(
              fontSize: 12,
              letterSpacing: 0.5,
              fontWeight: FontWeight.w500,
            ),
            labelSmall: data.textTheme.labelSmall?.copyWith(
              fontSize: 11,
              letterSpacing: 0.5,
              fontWeight: FontWeight.w500,
            ),
            bodyLarge: data.textTheme.bodyLarge?.copyWith(
              fontSize: 16,
              letterSpacing: 0.15,
            ),
            bodyMedium: data.textTheme.bodyMedium?.copyWith(
              fontSize: 14,
              letterSpacing: 0.25,
            ),
            bodySmall: data.textTheme.bodySmall?.copyWith(
              fontSize: 12,
              letterSpacing: 0.4,
            ),
          )
          .apply(
            bodyColor: isDark
                ? appColor.background.color
                : appColor.background.onColor,
            displayColor: isDark
                ? appColor.background.color
                : appColor.background.onColor,
            decorationColor: isDark
                ? appColor.background.color
                : appColor.background.onColor,
          ),
    );
    return data.copyWith(
      scaffoldBackgroundColor:
          isDark ? appColor.background.onColor : appColor.background.color,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: appColor.primary.color,
          foregroundColor: appColor.primary.onColor,
          textStyle: data.textTheme.labelLarge?.copyWith(
            fontWeight: FontWeight.w500,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ),
        ),
      ),
      inputDecorationTheme: data.inputDecorationTheme.copyWith(
        fillColor:
            isDark ? appColor.background.onColor : appColor.background.color,
        filled: true,
        hintStyle: data.textTheme.bodyLarge!.copyWith(
          color: appColor.grey.onColor.withOpacity(0.5),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 12,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: isDark
                ? appColor.background.color
                : appColor.background.onColor,
            width: 2,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: appColor.error.color,
            width: 2,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: appColor.primary.color,
            width: 2,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: appColor.grey.color,
            width: 2,
          ),
        ),
      ),
    );
  }
}
