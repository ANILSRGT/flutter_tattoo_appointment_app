part of 'splash_page.dart';

mixin SplashPageMixin on State<SplashPage> {
  @override
  void initState() {
    super.initState();
    // TODO: Implement splash screen logic
    Future.delayed(
      const Duration(seconds: 2),
      () {
        final firstTime = Injection.read<CacheManager>().get(
          CacheKeys.isFirstTime,
          defaultValue: true,
        )!;
        Injection.read<CacheManager>().set(CacheKeys.isFirstTime, false);
        Injection.read<AppRouter>().navigateToClear(
          firstTime ? AppRoutes.onboarding : AppRoutes.auth,
        );
      },
    );
  }
}
