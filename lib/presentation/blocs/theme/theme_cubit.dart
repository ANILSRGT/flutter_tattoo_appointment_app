import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tattoo_appointment/core/utils/theme/itheme.dart';
import 'package:tattoo_appointment/core/utils/theme/themes/main/main_theme.dart';
import 'package:tattoo_appointment/presentation/blocs/theme/app_themes.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit()
      : super(
          const ThemeState(
            currentTheme: MainTheme(),
            themeMode: ThemeMode.system,
          ),
        );

  void changeThemeMode(ThemeMode themeMode) {
    emit(state.copyWith(themeMode: themeMode));
  }

  void changeTheme(AppThemes themeType) {
    emit(state.copyWith(currentTheme: themeType.theme));
  }
}
