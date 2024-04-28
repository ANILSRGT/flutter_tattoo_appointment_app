// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tattoo_appointment/core/utils/theme/app_color.dart';
import 'package:tattoo_appointment/core/utils/theme/itheme.dart';
import 'package:tattoo_appointment/presentation/blocs/theme/theme_cubit.dart';

part 'theme_context_ext.dart';

extension ContextExt on BuildContext {
  _ContextExt get extApp => _ContextExt(this);
}

final class _ContextExt {
  const _ContextExt(BuildContext value) : _value = value;
  final BuildContext _value;

  _ThemeContextExt get theme => _ThemeContextExt(_value);
}
