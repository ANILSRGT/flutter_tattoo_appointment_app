import 'package:core/core.dart';
import 'package:tattoo_appointment/domain/entities/auth_entity.dart';

abstract interface class IAuthRepo {
  Stream<AuthEntity?> get userChanges;

  Future<AuthEntity?> get currentUser;

  Future<ResponseModel<AuthEntity>> signInWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<ResponseModel<AuthEntity>> signUpWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<ResponseModel<void>> signOut();
}
