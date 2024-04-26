part of 'context_ext.dart';

final class _ScreenContextExt {
  const _ScreenContextExt(this.context);
  final BuildContext context;

  Size get size => MediaQuery.of(context).size;
  double get width => size.width;
  double get height => size.height;
}
