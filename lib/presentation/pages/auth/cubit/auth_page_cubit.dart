import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tattoo_appointment/domain/usecases/auth/auth_sign_in_with_email_password_usecase.dart';
import 'package:tattoo_appointment/domain/usecases/auth/auth_sign_up_with_email_password_usecase.dart';
import 'package:tattoo_appointment/injection.dart';

part 'auth_page_state.dart';

class AuthPageCubit extends Cubit<AuthPageState> {
  AuthPageCubit() : super(const AuthPageState());

  void toggleSignUp() {
    emit(state.copyWith(isSignUp: !state.isSignUp));
  }

  void changePageState({required bool isBusy}) {
    emit(state.copyWith(isBusy: isBusy));
  }

  Future<void> signUp({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  }) async {
    final res =
        await Injection.read<AuthSignUpWithEmailPasswordUseCase>().execute(
      AuthSignUpWithEmailPasswordUseCaseParams(
        email: email,
        password: password,
      ),
    );

    emit(AuthPageStateResponse(response: res));
  }

  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    final res =
        await Injection.read<AuthSignInWithEmailPasswordUseCase>().execute(
      AuthSignInWithEmailPasswordUseCaseParams(
        email: email,
        password: password,
      ),
    );

    emit(AuthPageStateResponse(response: res));
  }
}
