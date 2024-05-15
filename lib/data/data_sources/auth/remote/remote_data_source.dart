import 'package:core/core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tattoo_appointment/data/data_sources/auth/remote/iremote_data_source.dart';
import 'package:tattoo_appointment/data/models/auth_model.dart';

final class RemoteDataSource implements IRemoteDataSource {
  RemoteDataSource(FirebaseAuth firebaseAuth) : _firebaseAuth = firebaseAuth;

  final FirebaseAuth _firebaseAuth;

  @override
  Future<ResponseModel<AuthModel>> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final res = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (res.user == null) {
        return const ResponseModelFail(
          message: 'message',
          throwMessage: ' throwMessage',
          code: 'code',
        );
      }

      final token = await res.user!.getIdToken();

      if (token == null) {
        return const ResponseModelFail(
          message: 'message',
          throwMessage: ' throwMessage',
          code: 'code',
        );
      }

      return ResponseModelSuccess(
        data: AuthModel(
          uid: res.user!.uid,
          token: token,
        ),
      );
    } catch (e) {
      return ResponseModelFail(
        message: 'message',
        throwMessage: e.toString(),
        code: 'code',
      );
    }
  }

  @override
  Future<ResponseModel<void>> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }

  @override
  Future<ResponseModel<AuthModel>> signUpWithEmailAndPassword({
    required String email,
    required String password,
  }) {
    // TODO: implement signUpWithEmailAndPassword
    throw UnimplementedError();
  }
}
