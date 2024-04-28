part of 'auth_page_cubit.dart';

final class AuthPageState with EquatableMixin {
  const AuthPageState({
    required this.isSignUp,
  });

  final bool isSignUp;

  @override
  List<Object?> get props => [isSignUp];
}
