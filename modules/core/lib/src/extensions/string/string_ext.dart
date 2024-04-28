// ignore_for_file: library_private_types_in_public_api

part 'validation_string_ext.dart';

extension StringExt on String? {
  _StringExt get ext => _StringExt(this);
}

final class _StringExt {
  const _StringExt(String? value) : _value = value;

  final String? _value;

  _ValidationStringExt get validation => _ValidationStringExt(_value);
}
