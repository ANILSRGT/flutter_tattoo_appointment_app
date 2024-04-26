part of 'theme_cubit.dart';

@immutable
final class ThemeState with EquatableMixin {
  const ThemeState({
    required this.currentTheme,
    required this.themeMode,
  });

  final ITheme currentTheme;
  final ThemeMode themeMode;

  ThemeState copyWith({
    ITheme? currentTheme,
    ThemeMode? themeMode,
  }) {
    return ThemeState(
      currentTheme: currentTheme ?? this.currentTheme,
      themeMode: themeMode ?? this.themeMode,
    );
  }

  @override
  List<Object?> get props => [currentTheme, themeMode];
}
