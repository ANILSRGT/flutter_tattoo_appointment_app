import 'dart:math';

import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:tattoo_appointment/core/constants/path/image_path.dart';
import 'package:tattoo_appointment/core/extensions/context/context_ext.dart';

part 'home_page_mixin.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with HomePageMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody,
    );
  }

  Widget get _buildBody {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildHeader,
        ],
      ),
    );
  }

  Widget get _buildHeader {
    return Material(
      borderRadius: context.ext.radius.border.directional.lgB,
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          _headerBGByLayout,
          Positioned(
            left: context.ext.values.md,
            bottom: context.ext.values.md,
            child: _headerSlogan,
          ),
        ],
      ),
    );
  }

  Widget get _headerBGByLayout {
    return LayoutBuilder(
      builder: (_, cst) {
        return SizedBox(
          width: min(cst.maxWidth, 600),
          height: min(cst.maxWidth, 600) * 0.5,
          child: _headerBG,
        );
      },
    );
  }

  Widget get _headerBG {
    return ColorFiltered(
      colorFilter: ColorFilter.mode(
        context.extApp.theme.currentThemeColor.black.color.withOpacity(0.8),
        BlendMode.multiply,
      ),
      child: Image.asset(
        ImagePathConstants.tattooTitle,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget get _headerSlogan {
    return Text(
      'Traces of Art: With You!',
      style: context.ext.theme.textTheme.titleLarge?.copyWith(
        color: context.extApp.theme.currentThemeColor.white.color,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
