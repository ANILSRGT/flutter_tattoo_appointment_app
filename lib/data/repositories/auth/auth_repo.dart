import 'package:core/core.dart';
import 'package:tattoo_appointment/data/data_sources/auth/local/iauth_local_data_source.dart';
import 'package:tattoo_appointment/data/data_sources/auth/remote/iauth_remote_data_source.dart';
import 'package:tattoo_appointment/data/models/auth_model.dart';
import 'package:tattoo_appointment/domain/repositories/auth/iauth_repo.dart';

final class AuthRepo implements IAuthRepo {
  AuthRepo({
    required IAuthRemoteDataSource remoteDataSource,
    required IAuthLocalDataSource localDataSource,
  })  : _remoteDataSource = remoteDataSource,
        _localDataSource = localDataSource;

  final IAuthRemoteDataSource _remoteDataSource;
  // ignore: unused_field
  final IAuthLocalDataSource _localDataSource;

  @override
  Stream<AuthModel?> get userChanges => _remoteDataSource.userChanges;

  @override
  Future<AuthModel?> get currentUser => _remoteDataSource.currentUser;

  @override
  Future<ResponseModel<AuthModel>> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    final resRemote = await _remoteDataSource.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    if (resRemote.isFail) return resRemote;

    return resRemote;
  }

  @override
  Future<ResponseModel<AuthModel>> signUpWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    final resRemote = await _remoteDataSource.signUpWithEmailAndPassword(
      email: email,
      password: password,
    );

    if (resRemote.isFail) return resRemote;

    return resRemote;
  }

  @override
  Future<ResponseModel<void>> signOut() async {
    final resRemote = await _remoteDataSource.signOut();

    if (resRemote.isFail) return resRemote;

    return resRemote;
  }
}
