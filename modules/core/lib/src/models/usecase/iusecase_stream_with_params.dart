import 'package:core/src/models/response/response_model.dart';

abstract interface class IUseCaseStreamWithParams<T, Params> {
  Stream<ResponseModel<T>> execute(Params params);
}
