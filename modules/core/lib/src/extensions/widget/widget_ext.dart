// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

part 'sliver_widget_ext.dart';

extension WidgetExt on Widget? {
  _WidgetExt get ext => _WidgetExt(this);
}

final class _WidgetExt {
  const _WidgetExt(Widget? value) : _value = value;

  final Widget? _value;

  _SliverWidgetExt get sliver => _SliverWidgetExt(_value);
}
