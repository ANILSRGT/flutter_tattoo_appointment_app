import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:tattoo_appointment/core/utils/cache/cache_keys.dart';
import 'package:tattoo_appointment/core/utils/cache/cache_manager.dart';
import 'package:tattoo_appointment/core/utils/router/app_router.dart';
import 'package:tattoo_appointment/core/utils/router/app_routes.dart';
import 'package:tattoo_appointment/injection.dart';

part 'splash_page_mixin.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with SplashPageMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody,
    );
  }

  Padding get _buildBody {
    return Padding(
      padding: context.ext.padding.all.lg,
      child: Center(
        child: Column(
          children: [
            const Spacer(),
            _appLogo,
            const Spacer(),
            _progressIndicator,
          ],
        ),
      ),
    );
  }

  FlutterLogo get _appLogo => const FlutterLogo(size: 100);

  CircularProgressIndicator get _progressIndicator {
    return const CircularProgressIndicator.adaptive();
  }
}
