import 'package:core/core.dart';
import 'package:tattoo_appointment/domain/entities/auth_entity.dart';
import 'package:tattoo_appointment/domain/repositories/auth/iauth_repo.dart';

final class AuthCurrentUserUseCase implements IUseCaseNoResponse<AuthEntity?> {
  AuthCurrentUserUseCase({
    required IAuthRepo authRepo,
  }) : _authRepo = authRepo;

  final IAuthRepo _authRepo;

  @override
  Future<AuthEntity?> execute() {
    return _authRepo.currentUser;
  }
}
