import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
          color: Color(0xFF4E0A6D),
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
        black: ThemeColor(
          color: Color(0xFF1D1D1D),
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
              overflow: TextOverflow.ellipsis,
            ),
            displayMedium: data.textTheme.displayMedium?.copyWith(
              fontSize: 45,
              overflow: TextOverflow.ellipsis,
            ),
            displaySmall: data.textTheme.displaySmall?.copyWith(
              fontSize: 36,
              overflow: TextOverflow.ellipsis,
            ),
            headlineLarge: data.textTheme.headlineLarge?.copyWith(
              fontSize: 32,
              overflow: TextOverflow.ellipsis,
            ),
            headlineMedium: data.textTheme.headlineMedium?.copyWith(
              fontSize: 28,
              overflow: TextOverflow.ellipsis,
            ),
            headlineSmall: data.textTheme.headlineSmall?.copyWith(
              fontSize: 24,
              overflow: TextOverflow.ellipsis,
            ),
            titleLarge: data.textTheme.titleLarge?.copyWith(
              fontSize: 22,
              fontWeight: FontWeight.w500,
              overflow: TextOverflow.ellipsis,
            ),
            titleMedium: data.textTheme.titleMedium?.copyWith(
              fontSize: 16,
              letterSpacing: 0.15,
              fontWeight: FontWeight.w500,
              overflow: TextOverflow.ellipsis,
            ),
            titleSmall: data.textTheme.titleSmall?.copyWith(
              fontSize: 14,
              letterSpacing: 0.1,
              fontWeight: FontWeight.w500,
              overflow: TextOverflow.ellipsis,
            ),
            labelLarge: data.textTheme.labelLarge?.copyWith(
              fontSize: 14,
              letterSpacing: 0.1,
              fontWeight: FontWeight.w500,
              overflow: TextOverflow.ellipsis,
            ),
            labelMedium: data.textTheme.labelMedium?.copyWith(
              fontSize: 12,
              letterSpacing: 0.5,
              fontWeight: FontWeight.w500,
              overflow: TextOverflow.ellipsis,
            ),
            labelSmall: data.textTheme.labelSmall?.copyWith(
              fontSize: 11,
              letterSpacing: 0.5,
              fontWeight: FontWeight.w500,
              overflow: TextOverflow.ellipsis,
            ),
            bodyLarge: data.textTheme.bodyLarge?.copyWith(
              fontSize: 16,
              letterSpacing: 0.15,
              overflow: TextOverflow.ellipsis,
            ),
            bodyMedium: data.textTheme.bodyMedium?.copyWith(
              fontSize: 14,
              letterSpacing: 0.25,
              overflow: TextOverflow.ellipsis,
            ),
            bodySmall: data.textTheme.bodySmall?.copyWith(
              fontSize: 12,
              letterSpacing: 0.4,
              overflow: TextOverflow.ellipsis,
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
            fontFamily: GoogleFonts.lato().fontFamily,
          ),
    );
    data = data.copyWith(
      textTheme: GoogleFonts.latoTextTheme(data.textTheme),
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
            horizontal: 8,
            vertical: 4,
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
      bottomNavigationBarTheme: data.bottomNavigationBarTheme.copyWith(
        backgroundColor:
            isDark ? appColor.background.onColor : appColor.background.color,
        selectedItemColor:
            isDark ? appColor.tertiary.color : appColor.primary.color,
        unselectedItemColor: appColor.grey.color,
        selectedIconTheme: data.iconTheme.copyWith(
          color: isDark ? appColor.tertiary.color : appColor.primary.color,
          size: 28,
        ),
        unselectedIconTheme: data.iconTheme.copyWith(
          color: appColor.grey.color,
          size: 22,
        ),
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedLabelStyle: data.textTheme.labelMedium?.copyWith(
          fontWeight: FontWeight.w500,
        ),
        unselectedLabelStyle: data.textTheme.labelMedium?.copyWith(
          fontWeight: FontWeight.w500,
        ),
      ),
      listTileTheme: data.listTileTheme.copyWith(
        tileColor:
            isDark ? appColor.background.onColor : appColor.background.color,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 4,
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        selectedColor: appColor.primary.color.withOpacity(0.1),
        selectedTileColor: appColor.primary.color.withOpacity(0.1),
        titleTextStyle: data.textTheme.bodyLarge?.copyWith(
          fontWeight: FontWeight.w500,
        ),
        subtitleTextStyle: data.textTheme.bodySmall?.copyWith(
          color: appColor.grey.color,
        ),
      ),
      chipTheme: data.chipTheme.copyWith(
        backgroundColor: appColor.black.color,
        deleteIconColor: appColor.error.color,
        disabledColor: appColor.grey.color,
        selectedColor: appColor.primary.color,
        secondarySelectedColor: appColor.secondary.color,
        labelPadding: const EdgeInsets.symmetric(
          horizontal: 6,
          vertical: 2,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 6,
          vertical: 2,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        labelStyle: data.textTheme.bodySmall?.copyWith(
          color: appColor.black.onColor,
          fontWeight: FontWeight.w500,
        ),
        secondaryLabelStyle: data.textTheme.bodySmall?.copyWith(
          color: appColor.secondary.onColor,
          fontWeight: FontWeight.w500,
        ),
        brightness: isDark ? Brightness.dark : Brightness.light,
      ),
    );
  }
}
