import 'package:core/src/models/response/response_model.dart';

abstract interface class IUseCaseStream<T> {
  Stream<ResponseModel<T>> execute();
}
