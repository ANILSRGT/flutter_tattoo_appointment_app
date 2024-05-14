import 'package:core/src/models/response/response_model.dart';

abstract interface class IUseCaseNoFuture<T> {
  ResponseModel<T> execute();
}
