import 'package:core/core.dart';
import 'package:flutter/material.dart';

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
      body: Padding(
        padding: context.ext.padding.all.lg,
        child: const Center(
          child: Column(
            children: [
              Spacer(),
              FlutterLogo(size: 100),
              Spacer(),
              CircularProgressIndicator.adaptive(),
            ],
          ),
        ),
      ),
    );
  }
}
