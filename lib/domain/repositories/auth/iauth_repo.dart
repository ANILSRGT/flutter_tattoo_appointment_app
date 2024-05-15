import 'package:core/core.dart';
import 'package:tattoo_appointment/domain/entities/auth_entity.dart';

abstract interface class IAuthRepo {
  Future<String?> getUserToken();

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
