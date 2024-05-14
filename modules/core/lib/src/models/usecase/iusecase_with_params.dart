import 'package:core/src/models/response/response_model.dart';

abstract interface class IUseCaseWithParams<T, Params> {
  Future<ResponseModel<T>> execute(Params params);
}
