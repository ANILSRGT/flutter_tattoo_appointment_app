import 'package:meta/meta.dart';

import 'package:tattoo_appointment/core/constants/errors/error_code_content_types.dart';
import 'package:tattoo_appointment/core/constants/errors/error_code_types.dart';

abstract interface class IErrorCode {
  @protected
  static String convertErrorCode({
    required ErrorCodeType type,
    required ErrorCodeContentType contentType,
    required int index,
  }) {
    return '${type.code}/${contentType.code}/${index.toString().padLeft(3, '0')}';
  }
}
