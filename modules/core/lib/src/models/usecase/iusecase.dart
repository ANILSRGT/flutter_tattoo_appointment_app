import 'package:core/src/models/response/response_model.dart';

abstract interface class IUseCase<T> {
  Future<ResponseModel<T>> execute();
}
