// ignore_for_file: library_private_types_in_public_api

part 'math_number_ext.dart';

extension NumberExt on num? {
  _NumberExt get ext => _NumberExt(this);
}

final class _NumberExt {
  const _NumberExt(num? value) : _value = value;

  final num? _value;

  _NumberMathExt get math => _NumberMathExt(_value);
}
