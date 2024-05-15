//! `code` values must be unique
enum ErrorCodeType {
  unknown(code: 'UN');

  const ErrorCodeType({
    required this.code,
  });

  final String code;
}
