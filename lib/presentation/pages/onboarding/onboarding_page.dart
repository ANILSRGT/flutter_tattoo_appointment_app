import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:tattoo_appointment/core/constants/localization/local_keys.g.dart';
import 'package:tattoo_appointment/core/extensions/string_ext.dart';
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
      body: Padding(
        padding: context.ext.padding.all.lg,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            context.ext.sizedBox.width.full,
            Text(LocalKeys.pagesOnboardingDescriptionPart1.toTr),
            Text(LocalKeys.pagesOnboardingDescriptionPart2.toTr),
            context.ext.sizedBox.height.lg,
            ElevatedButton(
              onPressed: _navigateToNextPage,
              child: Text(LocalKeys.pagesOnboardingButtonsGetStarted.toTr),
            ),
          ],
        ),
      ),
    );
  }
}
