import 'package:core/core.dart';
import 'package:tattoo_appointment/domain/entities/auth_entity.dart';
import 'package:tattoo_appointment/domain/repositories/auth/iauth_repo.dart';

final class AuthSignInWithEmailPasswordUseCase
    implements
        IUseCaseWithParams<AuthEntity,
            AuthSignInWithEmailPasswordUseCaseParams> {
  AuthSignInWithEmailPasswordUseCase(IAuthRepo authRepo) : _authRepo = authRepo;

  final IAuthRepo _authRepo;

  @override
  Future<ResponseModel<AuthEntity>> execute(
    AuthSignInWithEmailPasswordUseCaseParams params,
  ) {
    return _authRepo.signInWithEmailAndPassword(
      email: params.email,
      password: params.password,
    );
  }
}

final class AuthSignInWithEmailPasswordUseCaseParams {
  AuthSignInWithEmailPasswordUseCaseParams({
    required this.email,
    required this.password,
  });

  final String email;
  final String password;
}
