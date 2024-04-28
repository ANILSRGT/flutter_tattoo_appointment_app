part of 'bool_ext.dart';

final class _OperatorBoolExt {
  const _OperatorBoolExt(bool value) : _value = value;

  final bool _value;

  bool get not => !_value;

  bool and(bool other) => _value && other;

  bool or(bool other) => _value || other;

  bool xor(bool other) => _value ^ other;

  bool nand(bool other) => !(_value && other);

  bool nor(bool other) => !(_value || other);

  bool xnor(bool other) => !(_value ^ other);
}
