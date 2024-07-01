import 'package:core/core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tattoo_appointment/core/constants/localization/local_keys.g.dart';
import 'package:tattoo_appointment/core/extensions/string/string_ext.dart';
import 'package:tattoo_appointment/data/data_sources/auth/remote/iauth_remote_data_source.dart';
import 'package:tattoo_appointment/data/models/auth_model.dart';

final class AuthRemoteDataSource implements IAuthRemoteDataSource {
  AuthRemoteDataSource({
    required FirebaseAuth firebaseAuth,
  }) : _firebaseAuth = firebaseAuth;

  final FirebaseAuth _firebaseAuth;

  @override
  Stream<AuthModel?> get userChanges => _firebaseAuth.userChanges().asyncMap(
        (user) async {
          if (user == null) return null;

          final token = await user.getIdToken();

          if (token == null) return null;

          return AuthModel(
            uid: user.uid,
            token: token,
          );
        },
      );

  @override
  Future<AuthModel?> get currentUser async {
    final user = _firebaseAuth.currentUser;

    if (user == null) return null;

    final token = await user.getIdToken();

    if (token == null) return null;

    return AuthModel(
      uid: user.uid,
      token: token,
    );
  }

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
        return ResponseModelFail(
          message: LocalKeys
              .errorsAuthSignInWithEmailPasswordUserNotFoundMessage
              .appExt
              .locale
              .toTr,
          throwMessage: 'SignInWithEmailAndPassword: User not found',
          code: LocalKeys.errorsAuthSignInWithEmailPasswordUserNotFoundCode
              .appExt.locale.toTr,
        );
      }

      final token = await res.user!.getIdToken();

      if (token == null) {
        return ResponseModelFail(
          message: LocalKeys
              .errorsAuthSignInWithEmailPasswordTokenNotFoundMessage
              .appExt
              .locale
              .toTr,
          throwMessage: 'SignInWithEmailAndPassword: Token not found',
          code: LocalKeys.errorsAuthSignInWithEmailPasswordTokenNotFoundCode
              .appExt.locale.toTr,
        );
      }

      return ResponseModelSuccess(
        data: AuthModel(
          uid: res.user!.uid,
          token: token,
        ),
      );
    } on FirebaseAuthException catch (e) {
      var errCode = LocalKeys
          .errorsAuthSignInWithEmailPasswordFirebaseUnknownCode
          .appExt
          .locale
          .toTr;
      var errMessage = LocalKeys
          .errorsAuthSignInWithEmailPasswordFirebaseUnknownMessage
          .appExt
          .locale
          .toTr;

      switch (e.code) {
        case 'invalid-email':
          errCode = LocalKeys
              .errorsAuthSignInWithEmailPasswordFirebaseInvalidEmailCode
              .appExt
              .locale
              .toTr;
          errMessage = LocalKeys
              .errorsAuthSignInWithEmailPasswordFirebaseInvalidEmailMessage
              .appExt
              .locale
              .toTr;
        case 'user-disabled':
          errCode = LocalKeys
              .errorsAuthSignInWithEmailPasswordFirebaseUserDisabledCode
              .appExt
              .locale
              .toTr;
          errMessage = LocalKeys
              .errorsAuthSignInWithEmailPasswordFirebaseUserDisabledMessage
              .appExt
              .locale
              .toTr;
        case 'user-not-found':
          errCode = LocalKeys
              .errorsAuthSignInWithEmailPasswordFirebaseUserNotFoundCode
              .appExt
              .locale
              .toTr;
          errMessage = LocalKeys
              .errorsAuthSignInWithEmailPasswordFirebaseUserNotFoundMessage
              .appExt
              .locale
              .toTr;
        case 'wrong-password':
          errCode = LocalKeys
              .errorsAuthSignInWithEmailPasswordFirebaseWrongPasswordCode
              .appExt
              .locale
              .toTr;
          errMessage = LocalKeys
              .errorsAuthSignInWithEmailPasswordFirebaseWrongPasswordMessage
              .appExt
              .locale
              .toTr;
      }

      return ResponseModelFail(
        message: errMessage,
        throwMessage: 'SignInWithEmailAndPassword (firebase): ${e.message}',
        code: errCode,
      );
    } catch (e) {
      return ResponseModelFail(
        message: LocalKeys
            .errorsAuthSignInWithEmailPasswordUnknownMessage.appExt.locale.toTr,
        throwMessage: 'SignInWithEmailAndPassword (unknown): $e',
        code: LocalKeys
            .errorsAuthSignInWithEmailPasswordUnknownCode.appExt.locale.toTr,
      );
    }
  }

  @override
  Future<ResponseModel<AuthModel>> signUpWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final res = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (res.user == null) {
        return ResponseModelFail(
          message: LocalKeys
              .errorsAuthSignUpWithEmailPasswordUserNotFoundMessage
              .appExt
              .locale
              .toTr,
          throwMessage: 'SignUpWithEmailAndPassword: User not found',
          code: LocalKeys.errorsAuthSignUpWithEmailPasswordUserNotFoundCode
              .appExt.locale.toTr,
        );
      }

      final token = await res.user!.getIdToken();

      if (token == null) {
        return ResponseModelFail(
          message: LocalKeys
              .errorsAuthSignUpWithEmailPasswordTokenNotFoundMessage
              .appExt
              .locale
              .toTr,
          throwMessage: 'SignUpWithEmailAndPassword: Token not found',
          code: LocalKeys.errorsAuthSignUpWithEmailPasswordTokenNotFoundCode
              .appExt.locale.toTr,
        );
      }

      return ResponseModelSuccess(
        data: AuthModel(
          uid: res.user!.uid,
          token: token,
        ),
      );
    } on FirebaseAuthException catch (e) {
      var errCode = LocalKeys
          .errorsAuthSignUpWithEmailPasswordFirebaseUnknownCode
          .appExt
          .locale
          .toTr;
      var errMessage = LocalKeys
          .errorsAuthSignUpWithEmailPasswordFirebaseUnknownMessage
          .appExt
          .locale
          .toTr;

      switch (e.code) {
        case 'email-already-in-use':
          errCode = LocalKeys
              .errorsAuthSignUpWithEmailPasswordFirebaseEmailAlreadyInUseCode
              .appExt
              .locale
              .toTr;
          errMessage = LocalKeys
              .errorsAuthSignUpWithEmailPasswordFirebaseEmailAlreadyInUseMessage
              .appExt
              .locale
              .toTr;
        case 'invalid-email':
          errCode = LocalKeys
              .errorsAuthSignUpWithEmailPasswordFirebaseInvalidEmailCode
              .appExt
              .locale
              .toTr;
          errMessage = LocalKeys
              .errorsAuthSignUpWithEmailPasswordFirebaseInvalidEmailMessage
              .appExt
              .locale
              .toTr;
        case 'operation-not-allowed':
          errCode = LocalKeys
              .errorsAuthSignUpWithEmailPasswordFirebaseOperationNotAllowedCode
              .appExt
              .locale
              .toTr;
          errMessage = LocalKeys
              .errorsAuthSignUpWithEmailPasswordFirebaseOperationNotAllowedMessage
              .appExt
              .locale
              .toTr;
        case 'weak-password':
          errCode = LocalKeys
              .errorsAuthSignUpWithEmailPasswordFirebaseWeakPasswordCode
              .appExt
              .locale
              .toTr;
          errMessage = LocalKeys
              .errorsAuthSignUpWithEmailPasswordFirebaseWeakPasswordMessage
              .appExt
              .locale
              .toTr;
      }

      return ResponseModelFail(
        message: errMessage,
        throwMessage: 'SignUpWithEmailAndPassword (firebase): ${e.message}',
        code: errCode,
      );
    } catch (e) {
      return ResponseModelFail(
        message: LocalKeys
            .errorsAuthSignUpWithEmailPasswordUnknownMessage.appExt.locale.toTr,
        throwMessage: 'SignUpWithEmailAndPassword (unknown): $e',
        code: LocalKeys
            .errorsAuthSignUpWithEmailPasswordUnknownCode.appExt.locale.toTr,
      );
    }
  }

  @override
  Future<ResponseModel<void>> signOut() async {
    try {
      await _firebaseAuth.signOut();
      return const ResponseModelSuccess(data: null);
    } catch (e) {
      return ResponseModelFail(
        message: LocalKeys.errorsAuthSignOutUnknownMessage.appExt.locale.toTr,
        throwMessage: 'SignOut: $e',
        code: LocalKeys.errorsAuthSignOutUnknownCode.appExt.locale.toTr,
      );
    }
  }
}
