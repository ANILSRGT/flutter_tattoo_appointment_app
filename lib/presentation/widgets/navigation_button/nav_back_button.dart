import 'package:flutter/material.dart';
import 'package:tattoo_appointment/core/utils/router/app_router.dart';
import 'package:tattoo_appointment/injection.dart';

class NavBackButton extends StatelessWidget {
  const NavBackButton({
    super.key,
    this.iconSize = 24,
    this.foregroundColor,
    this.backgroundColor,
  });

  final double? iconSize;
  final Color? foregroundColor;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Injection.read<AppRouter>().pop(),
      child: backgroundColor != null
          ? CircleAvatar(
              radius: iconSize,
              backgroundColor: backgroundColor,
              foregroundColor: foregroundColor,
              child: _backIcon,
            )
          : _backIcon,
    );
  }

  Widget get _backIcon {
    return Icon(
      Icons.arrow_back_ios_new_rounded,
      color: foregroundColor,
      size: iconSize,
    );
  }
}
