import 'package:tattoo_appointment/core/utils/theme/itheme.dart';
import 'package:tattoo_appointment/core/utils/theme/themes/main/main_theme.dart';

enum AppThemes {
  main(
    theme: MainTheme(),
  );

  const AppThemes({
    required this.theme,
  });

  final ITheme theme;

  static AppThemes get defaultTheme => AppThemes.main;
}
