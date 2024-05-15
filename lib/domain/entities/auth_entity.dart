import 'package:equatable/equatable.dart';

class AuthEntity with EquatableMixin {
  AuthEntity({
    required this.uid,
    required this.token,
  });

  final String uid;
  final String token;

  @override
  List<Object> get props => [uid];
}
