// ignore_for_file: library_private_types_in_public_api

import 'package:easy_localization/easy_localization.dart';

part 'locale_string_ext.dart';

extension StringExt on String {
  _StringExt get appExt => _StringExt(this);
}

final class _StringExt {
  const _StringExt(String value) : _value = value;
  final String _value;

  _LocaleStringExt get locale => _LocaleStringExt(_value);
}
