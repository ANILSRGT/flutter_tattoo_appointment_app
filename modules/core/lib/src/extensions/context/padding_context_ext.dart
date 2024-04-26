part of 'context_ext.dart';

final class _PaddingContextExt {
  const _PaddingContextExt(BuildContext context) : _context = context;

  final BuildContext _context;

  _PaddingContextAllExt get all => _PaddingContextAllExt(_context);
  _PaddingContextHorizontalExt get horizontal =>
      _PaddingContextHorizontalExt(_context);
  _PaddingContextVerticalExt get vertical =>
      _PaddingContextVerticalExt(_context);
  _PaddingContextDirectionalExt get directional =>
      _PaddingContextDirectionalExt(_context);
}

final class _PaddingContextAllExt {
  const _PaddingContextAllExt(BuildContext context) : _context = context;

  final BuildContext _context;

  /// 4 pixels
  EdgeInsets get xs => EdgeInsets.all(_context.ext.values.xs);

  /// 8 pixels
  EdgeInsets get sm => EdgeInsets.all(_context.ext.values.sm);

  /// 16 pixels
  EdgeInsets get md => EdgeInsets.all(_context.ext.values.md);

  /// 20 pixels
  EdgeInsets get lg => EdgeInsets.all(_context.ext.values.lg);

  /// 24 pixels
  EdgeInsets get xl => EdgeInsets.all(_context.ext.values.xl);

  /// 32 pixels
  EdgeInsets get xxl => EdgeInsets.all(_context.ext.values.xxl);

  /// 40 pixels
  EdgeInsets get xxxl => EdgeInsets.all(_context.ext.values.xxxl);
}

final class _PaddingContextHorizontalExt {
  const _PaddingContextHorizontalExt(BuildContext context) : _context = context;

  final BuildContext _context;

  /// 4 pixels
  EdgeInsets get xs => EdgeInsets.symmetric(horizontal: _context.ext.values.xs);

  /// 8 pixels
  EdgeInsets get sm => EdgeInsets.symmetric(horizontal: _context.ext.values.sm);

  /// 16 pixels
  EdgeInsets get md => EdgeInsets.symmetric(horizontal: _context.ext.values.md);

  /// 20 pixels
  EdgeInsets get lg => EdgeInsets.symmetric(horizontal: _context.ext.values.lg);

  /// 24 pixels
  EdgeInsets get xl => EdgeInsets.symmetric(horizontal: _context.ext.values.xl);

  /// 32 pixels
  EdgeInsets get xxl =>
      EdgeInsets.symmetric(horizontal: _context.ext.values.xxl);

  /// 40 pixels
  EdgeInsets get xxxl =>
      EdgeInsets.symmetric(horizontal: _context.ext.values.xxxl);
}

final class _PaddingContextVerticalExt {
  const _PaddingContextVerticalExt(BuildContext context) : _context = context;

  final BuildContext _context;

  /// 4 pixels
  EdgeInsets get xs => EdgeInsets.symmetric(vertical: _context.ext.values.xs);

  /// 8 pixels
  EdgeInsets get sm => EdgeInsets.symmetric(vertical: _context.ext.values.sm);

  /// 16 pixels
  EdgeInsets get md => EdgeInsets.symmetric(vertical: _context.ext.values.md);

  /// 20 pixels
  EdgeInsets get lg => EdgeInsets.symmetric(vertical: _context.ext.values.lg);

  /// 24 pixels
  EdgeInsets get xl => EdgeInsets.symmetric(vertical: _context.ext.values.xl);

  /// 32 pixels
  EdgeInsets get xxl => EdgeInsets.symmetric(vertical: _context.ext.values.xxl);

  /// 40 pixels
  EdgeInsets get xxxl =>
      EdgeInsets.symmetric(vertical: _context.ext.values.xxxl);
}

final class _PaddingContextDirectionalExt {
  const _PaddingContextDirectionalExt(BuildContext context)
      : _context = context;

  final BuildContext _context;

  /// 4 pixels
  EdgeInsets get xsLeft => EdgeInsets.only(left: _context.ext.values.xs);

  /// 4 pixels
  EdgeInsets get xsRight => EdgeInsets.only(right: _context.ext.values.xs);

  /// 4 pixels
  EdgeInsets get xsTop => EdgeInsets.only(top: _context.ext.values.xs);

  /// 4 pixels
  EdgeInsets get xsBottom => EdgeInsets.only(bottom: _context.ext.values.xs);

  /// 8 pixels
  EdgeInsets get smLeft => EdgeInsets.only(left: _context.ext.values.sm);

  /// 8 pixels
  EdgeInsets get smRight => EdgeInsets.only(right: _context.ext.values.sm);

  /// 8 pixels
  EdgeInsets get smTop => EdgeInsets.only(top: _context.ext.values.sm);

  /// 8 pixels
  EdgeInsets get smBottom => EdgeInsets.only(bottom: _context.ext.values.sm);

  /// 16 pixels
  EdgeInsets get mdLeft => EdgeInsets.only(left: _context.ext.values.md);

  /// 16 pixels
  EdgeInsets get mdRight => EdgeInsets.only(right: _context.ext.values.md);

  /// 16 pixels
  EdgeInsets get mdTop => EdgeInsets.only(top: _context.ext.values.md);

  /// 16 pixels
  EdgeInsets get mdBottom => EdgeInsets.only(bottom: _context.ext.values.md);

  /// 20 pixels
  EdgeInsets get lgLeft => EdgeInsets.only(left: _context.ext.values.lg);

  /// 20 pixels
  EdgeInsets get lgRight => EdgeInsets.only(right: _context.ext.values.lg);

  /// 20 pixels
  EdgeInsets get lgTop => EdgeInsets.only(top: _context.ext.values.lg);

  /// 20 pixels
  EdgeInsets get lgBottom => EdgeInsets.only(bottom: _context.ext.values.lg);

  /// 24 pixels
  EdgeInsets get xlLeft => EdgeInsets.only(left: _context.ext.values.xl);

  /// 24 pixels
  EdgeInsets get xlRight => EdgeInsets.only(right: _context.ext.values.xl);

  /// 24 pixels
  EdgeInsets get xlTop => EdgeInsets.only(top: _context.ext.values.xl);

  /// 24 pixels
  EdgeInsets get xlBottom => EdgeInsets.only(bottom: _context.ext.values.xl);

  /// 32 pixels
  EdgeInsets get xxlLeft => EdgeInsets.only(left: _context.ext.values.xxl);

  /// 32 pixels
  EdgeInsets get xxlRight => EdgeInsets.only(right: _context.ext.values.xxl);

  /// 32 pixels
  EdgeInsets get xxlTop => EdgeInsets.only(top: _context.ext.values.xxl);

  /// 32 pixels
  EdgeInsets get xxlBottom => EdgeInsets.only(bottom: _context.ext.values.xxl);

  /// 40 pixels
  EdgeInsets get xxxlLeft => EdgeInsets.only(left: _context.ext.values.xxxl);

  /// 40 pixels
  EdgeInsets get xxxlRight => EdgeInsets.only(right: _context.ext.values.xxxl);

  /// 40 pixels
  EdgeInsets get xxxlTop => EdgeInsets.only(top: _context.ext.values.xxxl);

  /// 40 pixels
  EdgeInsets get xxxlBottom =>
      EdgeInsets.only(bottom: _context.ext.values.xxxl);
}
