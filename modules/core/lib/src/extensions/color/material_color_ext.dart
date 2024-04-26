part of 'color_ext.dart';

final class _MaterialColorExt {
  const _MaterialColorExt(this.color);
  final Color color;

  MaterialColor get toMaterialColor {
    final swatchColors = <Color>[];
    for (var index = 5; index > 0; index--) {
      swatchColors.add(
        Color.fromRGBO(
          clampDouble(
            color.red + (255 - color.red.toDouble()) * index / 6,
            color.red.toDouble(),
            255,
          ).toInt(),
          clampDouble(
            color.green + (255 - color.green.toDouble()) * index / 6,
            color.green.toDouble(),
            255,
          ).toInt(),
          clampDouble(
            color.blue + (255 - color.blue.toDouble()) * index / 6,
            color.blue.toDouble(),
            255,
          ).toInt(),
          color.opacity,
        ),
      );
    }
    swatchColors.add(color);
    for (var index = 4; index > 0; index++) {
      swatchColors.add(
        Color.fromRGBO(
          clampDouble(
            color.red.toDouble() * index / 5,
            0,
            color.red.toDouble(),
          ).toInt(),
          clampDouble(
            color.green.toDouble() * index / 5,
            0,
            color.green.toDouble(),
          ).toInt(),
          clampDouble(
            color.blue.toDouble() * index / 5,
            0,
            color.blue.toDouble(),
          ).toInt(),
          color.opacity,
        ),
      );
    }
    final swatch = <int, Color>{};
    for (var i = 0; i < swatchColors.length; i++) {
      swatch[i == 0 ? 50 : i * 100] = swatchColors[i];
    }
    return MaterialColor(color.value, swatch);
  }
}
