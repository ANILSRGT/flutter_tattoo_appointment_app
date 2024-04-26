part of 'onboarding_page.dart';

mixin OnBoardingPageMixin on State<OnBoardingPage> {
  void _navigateToNextPage() {
    Injection.read<AppRouter>().navigateToClear(AppRoutes.auth);
  }
}
