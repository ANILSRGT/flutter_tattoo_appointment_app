import 'package:flutter/material.dart';
import 'package:tattoo_appointment/core/utils/router/app_routes.dart';
import 'package:tattoo_appointment/data/models/auth_model.dart';

class AuthGuard extends StatelessWidget {
  const AuthGuard({
    required this.hasAuthGuard,
    required this.authenticatedUser,
    required this.child,
    super.key,
  });

  /// If data is true, the user is authenticated and the child widget is shown.
  /// <br>If data is false, the user is not authenticated and the auth page is shown.
  final Stream<AuthModel?> authenticatedUser;

  final bool hasAuthGuard;

  final Widget child;

  @override
  Widget build(BuildContext context) {
    if (!hasAuthGuard) return child;

    return StreamBuilder<AuthModel?>(
      stream: authenticatedUser,
      builder: (context, AsyncSnapshot<AuthModel?> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else {
          if (snapshot.hasData && snapshot.data != null) {
            return child;
          } else {
            return AppRoutes.auth.page;
          }
        }
      },
    );
  }
}
