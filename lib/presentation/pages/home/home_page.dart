import 'dart:async';
import 'dart:developer';
import 'dart:math' as math;

import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:tattoo_appointment/core/constants/localization/local_keys.g.dart';
import 'package:tattoo_appointment/core/constants/path/image_path.dart';
import 'package:tattoo_appointment/core/extensions/context/context_ext.dart';
import 'package:tattoo_appointment/core/extensions/string/string_ext.dart';
import 'package:tattoo_appointment/presentation/pages/home/cubit/home_page_cubit.dart';
import 'package:tattoo_appointment/presentation/widgets/tattoo_cards/medium_tattoo_card.dart';

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
    return CustomScrollView(
      controller: _scrollController,
      primary: _scrollController == null,
      slivers: [
        Stack(
          children: [
            _buildHeader,
            Positioned(
              top: context.ext.values.md,
              left: context.ext.values.md,
              right: context.ext.values.md,
              child: _headerSearchBar,
            ),
          ],
        ).ext.sliver.toBoxAdapter,
        _buildPopularTattoos.ext.sliver.toBoxAdapter,
        _buildMinimalistTattoos.ext.sliver.toBoxAdapter,
      ],
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
          width: math.min(cst.maxWidth, 600),
          height: math.min(cst.maxWidth, 600) * 0.5,
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

  Widget get _headerSearchBar {
    return SearchBar(
      controller: _searchController,
      focusNode: _searchFocusNode,
      hintStyle: WidgetStatePropertyAll(
        context.ext.theme.textTheme.bodyLarge?.copyWith(
          color: context.extApp.theme.currentThemeColor.black.onColor,
        ),
      ),
      textStyle: WidgetStatePropertyAll(
        context.ext.theme.textTheme.bodyLarge?.copyWith(
          color: context.extApp.theme.currentThemeColor.black.onColor,
        ),
      ),
      backgroundColor: WidgetStatePropertyAll<Color>(
        context.extApp.theme.currentThemeColor.black.color,
      ),
      hintText: LocalKeys.pagesHomeSearchPlaceholder.appExt.locale.toTr,
      trailing: [
        FloatingActionButton.small(
          onPressed: () => _search(_searchController.text),
          backgroundColor:
              context.extApp.theme.currentThemeColor.tertiary.color,
          shape: const CircleBorder(),
          child: Icon(
            Icons.search,
            color: context.extApp.theme.currentThemeColor.tertiary.onColor,
          ),
        ),
      ],
      onChanged: _onSearch,
    );
  }

  Widget get _headerSlogan {
    return Text(
      LocalKeys.pagesHomeTitleSlogan.appExt.locale.toTr,
      style: context.ext.theme.textTheme.titleLarge?.copyWith(
        color: context.extApp.theme.currentThemeColor.black.onColor,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget get _buildPopularTattoos {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _popularTattoosTitle,
        _popularTattoosList,
      ],
    );
  }

  Widget get _popularTattoosTitle {
    return Padding(
      padding: context.ext.padding.all.md,
      child: Text(
        LocalKeys.pagesHomePopularTattoosTitle.appExt.locale.toTr,
        maxLines: 1,
        style: context.ext.theme.textTheme.headlineSmall?.copyWith(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget get _popularTattoosList {
    return SizedBox(
      height: 220,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 8,
        padding: context.ext.padding.horizontal.sm,
        separatorBuilder: (_, __) => context.ext.sizedBox.width.sm,
        clipBehavior: Clip.none,
        itemBuilder: (_, index) {
          return _popularTattooItem(index);
        },
      ),
    );
  }

  Widget _popularTattooItem(int index) {
    return MediumTattooCard(
      id: 'tattoo_$index',
      title: 'Tattoo $index',
      image: NetworkImage(
        ''.ext.random.imageSquare,
      ),
      onView: (_) {},
    );
  }

  Widget get _buildMinimalistTattoos {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _minimalistTattoosTitle,
        _minimalistTattoosList,
      ],
    );
  }

  Widget get _minimalistTattoosTitle {
    return Padding(
      padding: context.ext.padding.all.md,
      child: Text(
        LocalKeys.pagesHomeMinimalistTattoosTitle.appExt.locale.toTr,
        maxLines: 1,
        style: context.ext.theme.textTheme.headlineSmall?.copyWith(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget get _minimalistTattoosList {
    return SizedBox(
      height: 220,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        padding: context.ext.padding.horizontal.sm,
        separatorBuilder: (_, __) => context.ext.sizedBox.width.sm,
        clipBehavior: Clip.none,
        itemBuilder: (_, index) {
          return _minimalistTattooItem(index);
        },
      ),
    );
  }

  Widget _minimalistTattooItem(int index) {
    return MediumTattooCard(
      id: 'minitattoo_$index',
      title: 'Tattoo $index',
      image: NetworkImage(
        ''.ext.random.imageSquare,
      ),
      onView: (_) {},
    );
  }
}
