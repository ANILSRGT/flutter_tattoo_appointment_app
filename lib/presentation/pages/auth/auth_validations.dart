import 'package:core/core.dart';
import 'package:tattoo_appointment/core/constants/localization/local_keys.g.dart';
import 'package:tattoo_appointment/core/extensions/string/string_ext.dart';

mixin AuthValidations {
  String? validateSignInEmail(String? value) {
    if (value.ext.validation.isNullOrEmpty) {
      return LocalKeys
          .pagesAuthFieldsSignInEmailValidsRequired.appExt.locale.toTr;
    }

    final trimmedValue = value!.trim();
    if (trimmedValue.ext.validation.isEmail.ext.operator.not) {
      return LocalKeys
          .pagesAuthFieldsSignInEmailValidsInvalid.appExt.locale.toTr;
    }

    return null;
  }

  String? validateSignInPassword(String? value) {
    if (value.ext.validation.isNullOrEmpty) {
      return LocalKeys
          .pagesAuthFieldsSignInPasswordValidsRequired.appExt.locale.toTr;
    }

    return null;
  }

  String? validateFirstName(String? value) {
    if (value.ext.validation.isNullOrEmpty) {
      return LocalKeys
          .pagesAuthFieldsSignUpFirstNameValidsRequired.appExt.locale.toTr;
    }

    final trimmedValue = value!.trim();
    if (trimmedValue.length < 2) {
      return LocalKeys
          .pagesAuthFieldsSignUpFirstNameValidsMinLengthArgs1.appExt.locale
          .toTrArgs(['2']);
    }

    if (trimmedValue.length > 50) {
      return LocalKeys
          .pagesAuthFieldsSignUpFirstNameValidsMaxLengthArgs1.appExt.locale
          .toTrArgs(['50']);
    }

    return null;
  }

  String? validateLastName(String? value) {
    if (value.ext.validation.isNullOrEmpty) {
      return LocalKeys
          .pagesAuthFieldsSignUpLastNameValidsRequired.appExt.locale.toTr;
    }

    final trimmedValue = value!.trim();
    if (trimmedValue.length < 2) {
      return LocalKeys
          .pagesAuthFieldsSignUpLastNameValidsMinLengthArgs1.appExt.locale
          .toTrArgs(['2']);
    }

    if (trimmedValue.length > 50) {
      return LocalKeys
          .pagesAuthFieldsSignUpLastNameValidsMaxLengthArgs1.appExt.locale
          .toTrArgs(['50']);
    }

    return null;
  }

  String? validateSignUpEmail(String? value) {
    if (value.ext.validation.isNullOrEmpty) {
      return LocalKeys
          .pagesAuthFieldsSignUpEmailValidsRequired.appExt.locale.toTr;
    }

    final trimmedValue = value!.trim();
    if (trimmedValue.ext.validation.isEmail.ext.operator.not) {
      return LocalKeys
          .pagesAuthFieldsSignUpEmailValidsInvalid.appExt.locale.toTr;
    }

    return null;
  }

  String? validateSignUpPassword(String? value) {
    if (value.ext.validation.isNullOrEmpty) {
      return LocalKeys
          .pagesAuthFieldsSignUpPasswordValidsRequired.appExt.locale.toTr;
    }

    final trimmedValue = value!.trim();
    if (trimmedValue.length < 8) {
      return LocalKeys
          .pagesAuthFieldsSignUpPasswordValidsMinLengthArgs1.appExt.locale
          .toTrArgs(['8']);
    }

    return null;
  }

  String? validateSignUpConfirmPassword(String? value, String password) {
    if (value.ext.validation.isNullOrEmpty) {
      return LocalKeys.pagesAuthFieldsSignUpConfirmPasswordValidsRequired.appExt
          .locale.toTr;
    }

    final trimmedValue = value!.trim();
    if (trimmedValue != password) {
      return LocalKeys.pagesAuthFieldsSignUpConfirmPasswordValidsNotMatch.appExt
          .locale.toTr;
    }

    return null;
  }
}
