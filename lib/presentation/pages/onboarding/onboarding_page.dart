import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:tattoo_appointment/core/constants/localization/local_keys.g.dart';
import 'package:tattoo_appointment/core/extensions/string/string_ext.dart';
import 'package:tattoo_appointment/core/utils/router/app_router.dart';
import 'package:tattoo_appointment/core/utils/router/app_routes.dart';
import 'package:tattoo_appointment/injection.dart';

part 'onboarding_page_mixin.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage>
    with OnBoardingPageMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody,
    );
  }

  Padding get _buildBody {
    return Padding(
      padding: context.ext.padding.all.lg,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: SingleChildScrollView(
          child: _bodyContent,
        ),
      ),
    );
  }

  Column get _bodyContent {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        context.ext.sizedBox.width.full,
        _descriptionTexts,
        context.ext.sizedBox.height.lg,
        _getStartedBtn,
      ],
    );
  }

  RichText get _descriptionTexts {
    return RichText(
      text: TextSpan(
        text:
            '${LocalKeys.pagesOnboardingDescriptionPart1.appExt.locale.toTr}\n',
        style: context.ext.theme.textTheme.headlineMedium?.copyWith(
          fontWeight: FontWeight.w600,
        ),
        children: [
          TextSpan(
            text: LocalKeys.pagesOnboardingDescriptionPart2.appExt.locale.toTr,
            style: context.ext.theme.textTheme.displayMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  SizedBox get _getStartedBtn {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: _navigateToNextPage,
        child: Text(
          LocalKeys.pagesOnboardingButtonsGetStarted.appExt.locale.toTr,
        ),
      ),
    );
  }
}
