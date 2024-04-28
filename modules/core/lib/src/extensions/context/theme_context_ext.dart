part of 'context_ext.dart';

final class _ThemeContextExt {
  const _ThemeContextExt(this.context);
  final BuildContext context;

  ThemeData get theme => Theme.of(context);
  TextTheme get textTheme => theme.textTheme;
  ColorScheme get colorScheme => theme.colorScheme;
  Brightness get brightness => theme.brightness;
  bool get isDark => brightness == Brightness.dark;
  bool get isLight => brightness == Brightness.light;
}
