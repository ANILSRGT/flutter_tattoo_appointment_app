import 'package:tattoo_appointment/core/utils/theme/theme_color.dart';

final class AppColor {
  const AppColor({
    required this.background,
    required this.primary,
    required this.secondary,
    required this.tertiary,
    required this.grey,
    required this.error,
    required this.success,
  });

  final ThemeColor background;
  final ThemeColor primary;
  final ThemeColor secondary;
  final ThemeColor tertiary;
  final ThemeColor grey;
  final ThemeColor error;
  final ThemeColor success;
}
