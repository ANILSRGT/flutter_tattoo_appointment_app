import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'auth_page_state.dart';

class AuthPageCubit extends Cubit<AuthPageState> {
  AuthPageCubit()
      : super(
          const AuthPageState(
            isSignUp: true,
          ),
        );

  void toggleSignUp() {
    emit(AuthPageState(isSignUp: !state.isSignUp));
  }
}
