// ignore_for_file: library_private_types_in_public_api

part 'operator_bool_ext.dart';

extension BoolExt on bool {
  _BoolExt get ext => _BoolExt(this);
}

final class _BoolExt {
  const _BoolExt(bool value) : _value = value;

  final bool _value;

  _OperatorBoolExt get operator => _OperatorBoolExt(_value);
}
