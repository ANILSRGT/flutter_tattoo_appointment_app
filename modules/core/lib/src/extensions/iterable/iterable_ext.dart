// ignore_for_file: library_private_types_in_public_api, strict_raw_type

part 'where_iterable_ext.dart';

extension IterableExt<T> on Iterable<T> {
  _IterableExt get ext => _IterableExt(this);
}

final class _IterableExt<T> {
  const _IterableExt(Iterable<T> iterable) : _iterable = iterable;

  final Iterable<T> _iterable;

  _WhereIterableExt<T> get where => _WhereIterableExt<T>(_iterable);
}
