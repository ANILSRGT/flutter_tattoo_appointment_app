part of 'context_ext.dart';

final class _SizedBoxContextExt {
  const _SizedBoxContextExt(this.context);
  final BuildContext context;

  _SizedBoxWidthContextExt get width => _SizedBoxWidthContextExt(context);
  _SizedBoxHeightContextExt get height => _SizedBoxHeightContextExt(context);
}

final class _SizedBoxWidthContextExt {
  const _SizedBoxWidthContextExt(this.context);
  final BuildContext context;

  /// 4 pixels
  SizedBox get xs => SizedBox(width: context.ext.values.xs);

  /// 8 pixels
  SizedBox get sm => SizedBox(width: context.ext.values.sm);

  /// 16 pixels
  SizedBox get md => SizedBox(width: context.ext.values.md);

  /// 20 pixels
  SizedBox get lg => SizedBox(width: context.ext.values.lg);

  /// 24 pixels
  SizedBox get xl => SizedBox(width: context.ext.values.xl);

  /// 32 pixels
  SizedBox get xxl => SizedBox(width: context.ext.values.xxl);

  /// 40 pixels
  SizedBox get xxxl => SizedBox(width: context.ext.values.xxxl);

  /// 100%
  SizedBox get full => const SizedBox(width: double.infinity);
}

final class _SizedBoxHeightContextExt {
  const _SizedBoxHeightContextExt(this.context);
  final BuildContext context;

  /// 4 pixels
  SizedBox get xs => SizedBox(height: context.ext.values.xs);

  /// 8 pixels
  SizedBox get sm => SizedBox(height: context.ext.values.sm);

  /// 16 pixels
  SizedBox get md => SizedBox(height: context.ext.values.md);

  /// 20 pixels
  SizedBox get lg => SizedBox(height: context.ext.values.lg);

  /// 24 pixels
  SizedBox get xl => SizedBox(height: context.ext.values.xl);

  /// 32 pixels
  SizedBox get xxl => SizedBox(height: context.ext.values.xxl);

  /// 40 pixels
  SizedBox get xxxl => SizedBox(height: context.ext.values.xxxl);

  /// 100%
  SizedBox get full => const SizedBox(height: double.infinity);
}
