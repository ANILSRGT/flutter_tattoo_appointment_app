import 'package:easy_localization/easy_localization.dart';

extension StringExt on String {
  String get toTr => tr(this);
  String toTrArgs(List<String> args) => tr(this, args: args);
}
