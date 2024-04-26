import 'package:flutter/material.dart';
import 'package:tattoo_appointment/core/utils/theme/app_color.dart';

abstract interface class ITheme {
  AppColor get appColor;
  ThemeData get lightTheme;
  ThemeData get darkTheme;
}
