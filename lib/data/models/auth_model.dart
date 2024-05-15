import 'package:tattoo_appointment/domain/entities/auth_entity.dart';

final class AuthModel extends AuthEntity {
  AuthModel({
    required super.uid,
    required super.token,
  });

  AuthModel.fromEntity(AuthEntity entity)
      : super(
          uid: entity.uid,
          token: entity.token,
        );

  AuthEntity toEntity() {
    return AuthEntity(
      uid: uid,
      token: token,
    );
  }
}
