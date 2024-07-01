part of 'auth_page_cubit.dart';

final class AuthPageState with EquatableMixin {
  const AuthPageState({
    this.isBusy = false,
    this.isSignUp = true,
  });

  final bool isBusy;
  final bool isSignUp;

  @override
  List<Object?> get props => [isBusy, isSignUp];

  AuthPageState copyWith({
    bool? isBusy,
    bool? isSignUp,
  }) {
    return AuthPageState(
      isBusy: isBusy ?? this.isBusy,
      isSignUp: isSignUp ?? this.isSignUp,
    );
  }
}

final class AuthPageStateResponse<T> extends AuthPageState {
  const AuthPageStateResponse({
    required this.response,
  });

  final ResponseModel<T> response;

  @override
  List<Object?> get props => [response];
}
