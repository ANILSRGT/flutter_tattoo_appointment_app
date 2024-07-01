import 'package:core/core.dart';
import 'package:tattoo_appointment/domain/entities/auth_entity.dart';
import 'package:tattoo_appointment/domain/repositories/auth/iauth_repo.dart';

final class AuthSignUpWithEmailPasswordUseCase
    implements
        IUseCaseWithParams<AuthEntity,
            AuthSignUpWithEmailPasswordUseCaseParams> {
  AuthSignUpWithEmailPasswordUseCase({
    required IAuthRepo authRepo,
  }) : _authRepo = authRepo;

  final IAuthRepo _authRepo;

  @override
  Future<ResponseModel<AuthEntity>> execute(
    AuthSignUpWithEmailPasswordUseCaseParams params,
  ) {
    return _authRepo.signUpWithEmailAndPassword(
      email: params.email,
      password: params.password,
    );
  }
}

final class AuthSignUpWithEmailPasswordUseCaseParams {
  AuthSignUpWithEmailPasswordUseCaseParams({
    required this.email,
    required this.password,
  });

  final String email;
  final String password;
}
