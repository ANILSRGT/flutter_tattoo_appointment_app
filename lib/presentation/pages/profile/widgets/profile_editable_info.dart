import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:tattoo_appointment/core/extensions/context/context_ext.dart';

class ProfileEditableInfo extends StatelessWidget {
  const ProfileEditableInfo({
    required this.icon,
    required this.content,
    super.key,
    this.maxLines = 1,
    this.hasBorder = true,
    this.onEdit,
    this.onTap,
    this.backgroundColor,
    this.contentColor,
    this.iconColor,
    this.borderColor,
  });

  /// The icon to be displayed
  final Widget icon;

  /// The content to be displayed
  final String content;

  /// 0 or less means no limit
  final int maxLines;

  /// If the edit icon is pressed
  final VoidCallback? onEdit;

  /// If the content is pressed
  final VoidCallback? onTap;

  final Color? backgroundColor;
  final Color? contentColor;
  final Color? iconColor;
  final Color? borderColor;

  final bool hasBorder;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: _buildBodyBG(context),
    );
  }

  Container _buildBodyBG(BuildContext context) {
    return Container(
      padding: context.ext.padding.all.md,
      decoration: BoxDecoration(
        color: backgroundColor ?? Colors.transparent,
        borderRadius: context.ext.radius.border.all.sm,
        border: hasBorder
            ? Border.all(
                color: borderColor ??
                    context.extApp.theme.currentThemeColor.grey.color,
              )
            : null,
      ),
      child: _buildBody(context),
    );
  }

  Row _buildBody(BuildContext context) {
    return Row(
      children: [
        _infoIcon(context),
        context.ext.sizedBox.width.md,
        Expanded(
          child: _infoContent(context),
        ),
        Visibility(
          visible: onEdit != null,
          child: _editIcon(context),
        ),
      ],
    );
  }

  ColorFiltered _infoIcon(BuildContext context) {
    return ColorFiltered(
      colorFilter: ColorFilter.mode(
        iconColor ?? context.extApp.theme.currentThemeColor.primary.color,
        BlendMode.srcIn,
      ),
      child: icon,
    );
  }

  Text _infoContent(BuildContext context) {
    return Text(
      content,
      maxLines: maxLines,
      textAlign: TextAlign.start,
      overflow: maxLines <= 0 ? TextOverflow.visible : TextOverflow.ellipsis,
      style: context.ext.theme.textTheme.bodyMedium?.copyWith(
        color:
            contentColor ?? context.extApp.theme.currentThemeColor.grey.color,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  GestureDetector _editIcon(BuildContext context) {
    return GestureDetector(
      onTap: onEdit,
      child: Icon(
        Icons.edit,
        color:
            iconColor ?? context.extApp.theme.currentThemeColor.primary.color,
      ),
    );
  }
}
