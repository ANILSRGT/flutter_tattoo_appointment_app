import 'package:core/core.dart';
import 'package:tattoo_appointment/data/models/auth_model.dart';

abstract interface class IRemoteDataSource {
  Future<ResponseModel<AuthModel>> signInWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<ResponseModel<AuthModel>> signUpWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<ResponseModel<void>> signOut();
}
