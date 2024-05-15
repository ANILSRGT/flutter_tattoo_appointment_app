import 'package:core/core.dart';

abstract interface class ILocalDataSource {
  Future<ResponseModel<void>> cacheUserToken(String token);
  Future<ResponseModel<void>> clearUserToken();
  Future<String?> getUserToken();
}
