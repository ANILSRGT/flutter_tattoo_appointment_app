import 'package:flutter/material.dart';
import 'package:tattoo_appointment/core/utils/router/app_routes.dart';

class AuthGuard extends StatelessWidget {
  const AuthGuard({
    required this.isAuthenticated,
    required this.child,
    super.key,
  });

  /// If data is true, the user is authenticated and the child widget is shown.
  /// <br>If data is false, the user is not authenticated and the auth page is shown.
  final Stream<bool> isAuthenticated;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
      stream: isAuthenticated,
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
