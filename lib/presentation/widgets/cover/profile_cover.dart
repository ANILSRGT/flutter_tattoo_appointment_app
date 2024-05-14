import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:tattoo_appointment/core/extensions/context/context_ext.dart';

class ProfileCover extends StatelessWidget {
  const ProfileCover({
    super.key,
    this.coverImage,
  });

  final ImageProvider? coverImage;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 820 / 312,
      child: Container(
        decoration: BoxDecoration(
          color: context.extApp.theme.currentThemeColor.secondary.color,
          borderRadius: context.ext.radius.border.directional.xlB,
          image: coverImage != null
              ? DecorationImage(
                  image: coverImage!,
                  fit: BoxFit.cover,
                )
              : null,
        ),
      ),
    );
  }
}
