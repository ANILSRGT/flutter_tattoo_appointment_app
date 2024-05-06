part of 'context_ext.dart';

final class _SizedBoxContextExt {
  const _SizedBoxContextExt(BuildContext context) : _context = context;
  final BuildContext _context;

  _SizedBoxWidthContextExt get width => _SizedBoxWidthContextExt(_context);
  _SizedBoxHeightContextExt get height => _SizedBoxHeightContextExt(_context);
}

final class _SizedBoxWidthContextExt {
  const _SizedBoxWidthContextExt(BuildContext context) : _context = context;
  final BuildContext _context;

  /// 4 pixels
  SizedBox get xs => SizedBox(width: _context.ext.values.xs);

  /// 8 pixels
  SizedBox get sm => SizedBox(width: _context.ext.values.sm);

  /// 16 pixels
  SizedBox get md => SizedBox(width: _context.ext.values.md);

  /// 20 pixels
  SizedBox get lg => SizedBox(width: _context.ext.values.lg);

  /// 24 pixels
  SizedBox get xl => SizedBox(width: _context.ext.values.xl);

  /// 32 pixels
  SizedBox get xxl => SizedBox(width: _context.ext.values.xxl);

  /// 40 pixels
  SizedBox get xxxl => SizedBox(width: _context.ext.values.xxxl);

  /// 100%
  SizedBox get full => const SizedBox(width: double.infinity);
}

final class _SizedBoxHeightContextExt {
  const _SizedBoxHeightContextExt(BuildContext context) : _context = context;
  final BuildContext _context;

  /// 4 pixels
  SizedBox get xs => SizedBox(height: _context.ext.values.xs);

  /// 8 pixels
  SizedBox get sm => SizedBox(height: _context.ext.values.sm);

  /// 16 pixels
  SizedBox get md => SizedBox(height: _context.ext.values.md);

  /// 20 pixels
  SizedBox get lg => SizedBox(height: _context.ext.values.lg);

  /// 24 pixels
  SizedBox get xl => SizedBox(height: _context.ext.values.xl);

  /// 32 pixels
  SizedBox get xxl => SizedBox(height: _context.ext.values.xxl);

  /// 40 pixels
  SizedBox get xxxl => SizedBox(height: _context.ext.values.xxxl);

  /// 100%
  SizedBox get full => const SizedBox(height: double.infinity);
}
