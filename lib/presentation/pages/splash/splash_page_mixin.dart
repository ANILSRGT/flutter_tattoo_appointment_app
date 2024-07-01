part of 'splash_page.dart';

mixin SplashPageMixin on State<SplashPage> {
  @override
  void initState() {
    super.initState();
    _initialize();
  }

  Future<void> _initialize() async {
    // Check if the app is opened for the first time
    final firstTime = Injection.read<CacheManager>().get(
      CacheKeys.isFirstTime,
      defaultValue: true,
    )!;
    await Injection.read<CacheManager>().set(CacheKeys.isFirstTime, false);

    // Navigate to the appropriate screen
    await Injection.read<AppRouter>().navigateToClear(
      firstTime ? AppRoutes.onboarding : AppRoutes.home,
    );
  }
}
