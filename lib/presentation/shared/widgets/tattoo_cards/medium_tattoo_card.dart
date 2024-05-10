import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:tattoo_appointment/core/extensions/context/context_ext.dart';

class MediumTattooCard extends StatelessWidget {
  const MediumTattooCard({
    required this.id,
    required this.title,
    required this.image,
    required this.onView,
    super.key,
  });

  final String id;
  final String title;
  final ImageProvider image;
  final void Function(String id) onView;
  // 'assets/images/dummy/tattoo/dummy_tattoo${index + 1}.png'

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: context.ext.padding.all.sm,
      width: context.ext.screen.width * 0.4,
      decoration: BoxDecoration(
        borderRadius: context.ext.radius.border.all.sm,
        color: context.extApp.theme.currentThemeColor.black.color,
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Material(
              borderRadius: context.ext.radius.border.all.xs,
              clipBehavior: Clip.antiAlias,
              child: Image(
                image: image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          context.ext.sizedBox.height.sm,
          Text(
            title,
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: context.ext.theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w500,
              color: context.extApp.theme.currentThemeColor.black.onColor,
            ),
          ),
          context.ext.sizedBox.height.md,
          SizedBox(
            height: 35,
            child: ElevatedButton(
              onPressed: () => onView(id),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: context.ext.radius.border.all.xs,
                ),
              ),
              child: const Text('View'),
            ),
          ),
        ],
      ),
    );
  }
}
