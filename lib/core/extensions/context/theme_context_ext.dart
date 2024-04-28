part of 'context_ext.dart';

final class _ThemeContextExt {
  const _ThemeContextExt(BuildContext context) : _context = context;
  final BuildContext _context;

  ITheme get currentThemeType =>
      _context.watch<ThemeCubit>().state.currentTheme;
  AppColor get currentThemeColor => currentThemeType.appColor;
}
