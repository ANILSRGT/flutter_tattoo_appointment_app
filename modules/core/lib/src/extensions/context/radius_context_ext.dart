part of 'context_ext.dart';

final class _RadiusContextExt {
  const _RadiusContextExt(BuildContext context) : _context = context;
  final BuildContext _context;

  _RadiusCircularContextExt get circular => _RadiusCircularContextExt(_context);
  _BorderRadiusContextExt get border => _BorderRadiusContextExt(_context);
}

final class _RadiusCircularContextExt {
  const _RadiusCircularContextExt(BuildContext context) : _context = context;
  final BuildContext _context;

  /// 0 pixels
  Radius get zero => Radius.zero;

  /// 4 pixels
  Radius get xs => Radius.circular(_context.ext.values.xs);

  /// 8 pixels
  Radius get sm => Radius.circular(_context.ext.values.sm);

  /// 16 pixels
  Radius get md => Radius.circular(_context.ext.values.md);

  /// 20 pixels
  Radius get lg => Radius.circular(_context.ext.values.lg);

  /// 24 pixels
  Radius get xl => Radius.circular(_context.ext.values.xl);

  /// 32 pixels
  Radius get xxl => Radius.circular(_context.ext.values.xxl);

  /// 40 pixels
  Radius get xxxl => Radius.circular(_context.ext.values.xxxl);
}

final class _BorderRadiusContextExt {
  const _BorderRadiusContextExt(BuildContext context) : _context = context;
  final BuildContext _context;

  BorderRadius get zero => BorderRadius.zero;

  _BorderRadiusCircularContextExt get all =>
      _BorderRadiusCircularContextExt(_context);
  _BoderRadiusOnlyContextExt get directional =>
      _BoderRadiusOnlyContextExt(_context);
}

final class _BorderRadiusCircularContextExt {
  const _BorderRadiusCircularContextExt(BuildContext context)
      : _context = context;
  final BuildContext _context;

  /// 4 pixels
  BorderRadius get xs => BorderRadius.circular(_context.ext.values.xs);

  /// 8 pixels
  BorderRadius get sm => BorderRadius.circular(_context.ext.values.sm);

  /// 16 pixels
  BorderRadius get md => BorderRadius.circular(_context.ext.values.md);

  /// 20 pixels
  BorderRadius get lg => BorderRadius.circular(_context.ext.values.lg);

  /// 24 pixels
  BorderRadius get xl => BorderRadius.circular(_context.ext.values.xl);

  /// 32 pixels
  BorderRadius get xxl => BorderRadius.circular(_context.ext.values.xxl);

  /// 40 pixels
  BorderRadius get xxxl => BorderRadius.circular(_context.ext.values.xxxl);
}

final class _BoderRadiusOnlyContextExt {
  const _BoderRadiusOnlyContextExt(BuildContext context) : _context = context;
  final BuildContext _context;

  /// 4 pixels
  /// <br> T = Top, B = Bottom, L = Left, R = Right
  BorderRadius get xsTL =>
      BorderRadius.only(topLeft: Radius.circular(_context.ext.values.xs));

  /// 4 pixels
  /// <br> T = Top, B = Bottom, L = Left, R = Right
  BorderRadius get xsTR =>
      BorderRadius.only(topRight: Radius.circular(_context.ext.values.xs));

  /// 4 pixels
  /// <br> T = Top, B = Bottom, L = Left, R = Right
  BorderRadius get xsBL =>
      BorderRadius.only(bottomLeft: Radius.circular(_context.ext.values.xs));

  /// 4 pixels
  /// <br> T = Top, B = Bottom, L = Left, R = Right
  BorderRadius get xsBR =>
      BorderRadius.only(bottomRight: Radius.circular(_context.ext.values.xs));

  /// 4 pixels
  /// <br> T = Top, B = Bottom, L = Left, R = Right
  BorderRadius get xsT => xsTL + xsTR;

  /// 4 pixels
  /// <br> T = Top, B = Bottom, L = Left, R = Right
  BorderRadius get xsB => xsBL + xsBR;

  /// 4 pixels
  /// <br> T = Top, B = Bottom, L = Left, R = Right
  BorderRadius get xsL => xsTL + xsBL;

  /// 4 pixels
  /// <br> T = Top, B = Bottom, L = Left, R = Right
  BorderRadius get xsR => xsTR + xsBR;

  /// 8 pixels
  /// <br> T = Top, B = Bottom, L = Left, R = Right
  BorderRadius get smTL =>
      BorderRadius.only(topLeft: Radius.circular(_context.ext.values.sm));

  /// 8 pixels
  /// <br> T = Top, B = Bottom, L = Left, R = Right
  BorderRadius get smTR =>
      BorderRadius.only(topRight: Radius.circular(_context.ext.values.sm));

  /// 8 pixels
  /// <br> T = Top, B = Bottom, L = Left, R = Right
  BorderRadius get smBL =>
      BorderRadius.only(bottomLeft: Radius.circular(_context.ext.values.sm));

  /// 8 pixels
  /// <br> T = Top, B = Bottom, L = Left, R = Right
  BorderRadius get smBR =>
      BorderRadius.only(bottomRight: Radius.circular(_context.ext.values.sm));

  /// 8 pixels
  /// <br> T = Top, B = Bottom, L = Left, R = Right
  BorderRadius get smT => smTL + smTR;

  /// 8 pixels
  /// <br> T = Top, B = Bottom, L = Left, R = Right
  BorderRadius get smB => smBL + smBR;

  /// 8 pixels
  /// <br> T = Top, B = Bottom, L = Left, R = Right
  BorderRadius get smL => smTL + smBL;

  /// 8 pixels
  /// <br> T = Top, B = Bottom, L = Left, R = Right
  BorderRadius get smR => smTR + smBR;

  /// 16 pixels
  /// <br> T = Top, B = Bottom, L = Left, R = Right
  BorderRadius get mdTL =>
      BorderRadius.only(topLeft: Radius.circular(_context.ext.values.md));

  /// 16 pixels
  /// <br> T = Top, B = Bottom, L = Left, R = Right
  BorderRadius get mdTR =>
      BorderRadius.only(topRight: Radius.circular(_context.ext.values.md));

  /// 16 pixels
  /// <br> T = Top, B = Bottom, L = Left, R = Right
  BorderRadius get mdBL =>
      BorderRadius.only(bottomLeft: Radius.circular(_context.ext.values.md));

  /// 16 pixels
  /// <br> T = Top, B = Bottom, L = Left, R = Right
  BorderRadius get mdBR =>
      BorderRadius.only(bottomRight: Radius.circular(_context.ext.values.md));

  /// 16 pixels
  /// <br> T = Top, B = Bottom, L = Left, R = Right
  BorderRadius get mdT => mdTL + mdTR;

  /// 16 pixels
  /// <br> T = Top, B = Bottom, L = Left, R = Right
  BorderRadius get mdB => mdBL + mdBR;

  /// 16 pixels
  /// <br> T = Top, B = Bottom, L = Left, R = Right
  BorderRadius get mdL => mdTL + mdBL;

  /// 16 pixels
  /// <br> T = Top, B = Bottom, L = Left, R = Right
  BorderRadius get mdR => mdTR + mdBR;

  /// 20 pixels
  /// <br> T = Top, B = Bottom, L = Left, R = Right
  BorderRadius get lgTL =>
      BorderRadius.only(topLeft: Radius.circular(_context.ext.values.lg));

  /// 20 pixels
  /// <br> T = Top, B = Bottom, L = Left, R = Right
  BorderRadius get lgTR =>
      BorderRadius.only(topRight: Radius.circular(_context.ext.values.lg));

  /// 20 pixels
  /// <br> T = Top, B = Bottom, L = Left, R = Right
  BorderRadius get lgBL =>
      BorderRadius.only(bottomLeft: Radius.circular(_context.ext.values.lg));

  /// 20 pixels
  /// <br> T = Top, B = Bottom, L = Left, R = Right
  BorderRadius get lgBR =>
      BorderRadius.only(bottomRight: Radius.circular(_context.ext.values.lg));

  /// 20 pixels
  /// <br> T = Top, B = Bottom, L = Left, R = Right
  BorderRadius get lgT => lgTL + lgTR;

  /// 20 pixels
  /// <br> T = Top, B = Bottom, L = Left, R = Right
  BorderRadius get lgB => lgBL + lgBR;

  /// 20 pixels
  /// <br> T = Top, B = Bottom, L = Left, R = Right
  BorderRadius get lgL => lgTL + lgBL;

  /// 20 pixels
  /// <br> T = Top, B = Bottom, L = Left, R = Right
  BorderRadius get lgR => lgTR + lgBR;

  /// 24 pixels
  /// <br> T = Top, B = Bottom, L = Left, R = Right
  BorderRadius get xlTL =>
      BorderRadius.only(topLeft: Radius.circular(_context.ext.values.xl));

  /// 24 pixels
  /// <br> T = Top, B = Bottom, L = Left, R = Right
  BorderRadius get xlTR =>
      BorderRadius.only(topRight: Radius.circular(_context.ext.values.xl));

  /// 24 pixels
  /// <br> T = Top, B = Bottom, L = Left, R = Right
  BorderRadius get xlBL =>
      BorderRadius.only(bottomLeft: Radius.circular(_context.ext.values.xl));

  /// 24 pixels
  /// <br> T = Top, B = Bottom, L = Left, R = Right
  BorderRadius get xlBR =>
      BorderRadius.only(bottomRight: Radius.circular(_context.ext.values.xl));

  /// 24 pixels
  /// <br> T = Top, B = Bottom, L = Left, R = Right
  BorderRadius get xlT => xlTL + xlTR;

  /// 24 pixels
  /// <br> T = Top, B = Bottom, L = Left, R = Right
  BorderRadius get xlB => xlBL + xlBR;

  /// 24 pixels
  /// <br> T = Top, B = Bottom, L = Left, R = Right
  BorderRadius get xlL => xlTL + xlBL;

  /// 24 pixels
  /// <br> T = Top, B = Bottom, L = Left, R = Right
  BorderRadius get xlR => xlTR + xlBR;

  /// 32 pixels
  /// <br> T = Top, B = Bottom, L = Left, R = Right
  BorderRadius get xxlTL =>
      BorderRadius.only(topLeft: Radius.circular(_context.ext.values.xxl));

  /// 32 pixels
  /// <br> T = Top, B = Bottom, L = Left, R = Right
  BorderRadius get xxlTR =>
      BorderRadius.only(topRight: Radius.circular(_context.ext.values.xxl));

  /// 32 pixels
  /// <br> T = Top, B = Bottom, L = Left, R = Right
  BorderRadius get xxlBL =>
      BorderRadius.only(bottomLeft: Radius.circular(_context.ext.values.xxl));

  /// 32 pixels
  /// <br> T = Top, B = Bottom, L = Left, R = Right
  BorderRadius get xxlBR =>
      BorderRadius.only(bottomRight: Radius.circular(_context.ext.values.xxl));

  /// 32 pixels
  /// <br> T = Top, B = Bottom, L = Left, R = Right
  BorderRadius get xxlT => xxlTL + xxlTR;

  /// 32 pixels
  /// <br> T = Top, B = Bottom, L = Left, R = Right
  BorderRadius get xxlB => xxlBL + xxlBR;

  /// 32 pixels
  /// <br> T = Top, B = Bottom, L = Left, R = Right
  BorderRadius get xxlL => xxlTL + xxlBL;

  /// 32 pixels
  /// <br> T = Top, B = Bottom, L = Left, R = Right
  BorderRadius get xxlR => xxlTR + xxlBR;

  /// 40 pixels
  /// <br> T = Top, B = Bottom, L = Left, R = Right
  BorderRadius get xxxlTL =>
      BorderRadius.only(topLeft: Radius.circular(_context.ext.values.xxxl));

  /// 40 pixels
  /// <br> T = Top, B = Bottom, L = Left, R = Right
  BorderRadius get xxxlTR =>
      BorderRadius.only(topRight: Radius.circular(_context.ext.values.xxxl));

  /// 40 pixels
  /// <br> T = Top, B = Bottom, L = Left, R = Right
  BorderRadius get xxxlBL =>
      BorderRadius.only(bottomLeft: Radius.circular(_context.ext.values.xxxl));

  /// 40 pixels
  /// <br> T = Top, B = Bottom, L = Left, R = Right
  BorderRadius get xxxlBR =>
      BorderRadius.only(bottomRight: Radius.circular(_context.ext.values.xxxl));

  /// 40 pixels
  /// <br> T = Top, B = Bottom, L = Left, R = Right
  BorderRadius get xxxlT => xxxlTL + xxxlTR;

  /// 40 pixels
  /// <br> T = Top, B = Bottom, L = Left, R = Right
  BorderRadius get xxxlB => xxxlBL + xxxlBR;

  /// 40 pixels
  /// <br> T = Top, B = Bottom, L = Left, R = Right
  BorderRadius get xxxlL => xxxlTL + xxxlBL;

  /// 40 pixels
  /// <br> T = Top, B = Bottom, L = Left, R = Right
  BorderRadius get xxxlR => xxxlTR + xxxlBR;
}
