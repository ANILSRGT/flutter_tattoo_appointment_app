part of 'string_ext.dart';

final class _ValidationStringExt {
  const _ValidationStringExt(String? value) : _value = value;

  final String? _value;

  bool get isNullOrEmpty => _value == null || _value.isEmpty;

  bool get isEmail =>
      RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(_value ?? '');

  bool get isPhoneNumber =>
      RegExp(r'^\+(?:[0-9]●?){6,14}[0-9]$').hasMatch(_value ?? '');
}
