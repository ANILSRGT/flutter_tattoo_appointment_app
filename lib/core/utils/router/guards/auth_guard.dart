import 'package:flutter/material.dart';
import 'package:tattoo_appointment/core/utils/router/app_routes.dart';

class AuthGuard extends StatelessWidget {
  const AuthGuard({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    Future<bool> checkAuth() async {
      return true;
    }

    return FutureBuilder(
      future: checkAuth(),
      builder: (context, AsyncSnapshot<bool> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else {
          if (snapshot.hasData && snapshot.data != null && snapshot.data!) {
            return child;
          } else {
            return AppRoutes.auth.page;
          }
        }
      },
    );
  }
}
