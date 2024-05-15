//! `code` values must be unique
enum ErrorCodeContentType {
  auth(code: 'AU'),
  user(code: 'US'),
  unknown(code: 'UN');

  const ErrorCodeContentType({
    required this.code,
  });

  final String code;
}
