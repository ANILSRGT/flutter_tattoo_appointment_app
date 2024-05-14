import 'package:flutter/material.dart';
import 'package:tattoo_appointment/core/extensions/context/context_ext.dart';

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({
    super.key,
    this.avatarSize = 28,
    this.userPhoto,
  });

  final double avatarSize;
  final ImageProvider? userPhoto;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: avatarSize,
      backgroundColor: context.extApp.theme.currentThemeColor.primary.color,
      foregroundColor: context.extApp.theme.currentThemeColor.primary.onColor,
      backgroundImage: userPhoto,
      child: userPhoto == null
          ? Icon(
              Icons.person,
              size: avatarSize,
              color: context.extApp.theme.currentThemeColor.primary.onColor,
            )
          : null,
    );
  }
}
