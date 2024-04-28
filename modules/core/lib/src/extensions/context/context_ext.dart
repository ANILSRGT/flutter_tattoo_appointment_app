// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

part 'padding_context_ext.dart';
part 'screen_context_ext.dart';
part 'values_context_ext.dart';
part 'sizedbox_context_ext.dart';
part 'theme_context_ext.dart';

extension ContextExt on BuildContext {
  _ContextExt get ext => _ContextExt(this);
}

final class _ContextExt {
  const _ContextExt(BuildContext context) : _context = context;

  final BuildContext _context;

  _ValuesContextExt get values => _ValuesContextExt(_context);
  _ScreenContextExt get screen => _ScreenContextExt(_context);
  _PaddingContextExt get padding => _PaddingContextExt(_context);
  _SizedBoxContextExt get sizedBox => _SizedBoxContextExt(_context);
  _ThemeContextExt get theme => _ThemeContextExt(_context);
}
