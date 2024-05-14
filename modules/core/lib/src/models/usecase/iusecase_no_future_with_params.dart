import 'package:core/src/models/response/response_model.dart';

abstract interface class IUseCaseNoFutureWithParams<T, Params> {
  ResponseModel<T> execute(Params params);
}
