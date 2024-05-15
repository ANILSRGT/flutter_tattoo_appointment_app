import 'package:core/core.dart';
import 'package:tattoo_appointment/data/data_sources/auth/local/ilocal_data_source.dart';
import 'package:tattoo_appointment/data/data_sources/auth/remote/iremote_data_source.dart';
import 'package:tattoo_appointment/domain/entities/auth_entity.dart';
import 'package:tattoo_appointment/domain/repositories/auth/iauth_repo.dart';

final class AuthRepo implements IAuthRepo {
  AuthRepo({
    required IRemoteDataSource remoteDataSource,
    required ILocalDataSource localDataSource,
  })  : _remoteDataSource = remoteDataSource,
        _localDataSource = localDataSource;

  final IRemoteDataSource _remoteDataSource;
  final ILocalDataSource _localDataSource;

  @override
  Future<String?> getUserToken() => _localDataSource.getUserToken();

  @override
  Future<ResponseModel<AuthEntity>> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    final resRemote = await _remoteDataSource.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    if (resRemote.isFail) return resRemote;

    final resLocal = await _localDataSource.cacheUserToken(
      resRemote.asSuccess.data.token,
    );

    if (resLocal.isFail) return resLocal.asFail.convertTo<AuthEntity>();

    return resRemote;
  }

  @override
  Future<ResponseModel<AuthEntity>> signUpWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    final resRemote = await _remoteDataSource.signUpWithEmailAndPassword(
      email: email,
      password: password,
    );

    if (resRemote.isFail) return resRemote;

    final resLocal = await _localDataSource.cacheUserToken(
      resRemote.asSuccess.data.token,
    );

    if (resLocal.isFail) return resLocal.asFail.convertTo<AuthEntity>();

    return resRemote;
  }

  @override
  Future<ResponseModel<void>> signOut() async {
    final resRemote = await _remoteDataSource.signOut();

    if (resRemote.isFail) return resRemote;

    final resLocal = await _localDataSource.clearUserToken();

    if (resLocal.isFail) return resLocal.asFail;

    return resRemote;
  }
}
