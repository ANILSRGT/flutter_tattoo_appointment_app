import 'package:core/core.dart';
import 'package:tattoo_appointment/domain/repositories/auth/iauth_repo.dart';

final class AuthSignOutUseCase implements IUseCase<void> {
  AuthSignOutUseCase({
    required IAuthRepo authRepo,
  }) : _authRepo = authRepo;

  final IAuthRepo _authRepo;

  @override
  Future<ResponseModel<void>> execute() {
    return _authRepo.signOut();
  }
}
