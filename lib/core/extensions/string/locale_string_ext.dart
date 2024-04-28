part of 'string_ext.dart';

final class _LocaleStringExt {
  const _LocaleStringExt(String value) : _value = value;
  final String _value;

  String get toTr => tr(_value);
  String toTrArgs(List<String> args) => tr(_value, args: args);
}
