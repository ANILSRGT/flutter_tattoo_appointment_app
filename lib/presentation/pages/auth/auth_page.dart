import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tattoo_appointment/core/constants/localization/local_keys.g.dart';
import 'package:tattoo_appointment/core/extensions/context/context_ext.dart';
import 'package:tattoo_appointment/core/extensions/string/string_ext.dart';
import 'package:tattoo_appointment/presentation/pages/auth/auth_validations.dart';
import 'package:tattoo_appointment/presentation/pages/auth/cubit/auth_page_cubit.dart';
import 'package:tattoo_appointment/presentation/widgets/fields/app_text_field.dart';

part 'auth_page_mixin.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage>
    with AuthPageMixin, AuthValidations {
  @override
  Widget build(_) {
    return BlocProvider(
      create: (_) => _authPageCubit,
      child: Builder(
        builder: (context) {
          return Scaffold(
            body: _buildBody,
          );
        },
      ),
    );
  }

  Center get _buildBody {
    return Center(
      child: SingleChildScrollView(
        child: _buildBodyContent,
      ),
    );
  }

  Padding get _buildBodyContent {
    return Padding(
      padding: context.ext.padding.horizontal.lg,
      child: Column(
        children: [
          _pageSignStateTitle,
          context.ext.sizedBox.height.xxxl,
          _firstAndLastNameFields,
          _stateToWidget((state) {
            return context.ext.sizedBox.height.sm;
          }),
          _emailField,
          context.ext.sizedBox.height.sm,
          _passwordField,
          context.ext.sizedBox.height.sm,
          _stateToWidget((state) {
            return AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: state.isSignUp ? _confirmPasswordField : _forgotPassword,
            );
          }),
          context.ext.sizedBox.height.xl,
          _submitBtn,
          context.ext.sizedBox.height.xxxl,
          _haveAccountBtn,
        ],
      ),
    );
  }

  Widget get _pageSignStateTitle {
    return _stateToWidget(
      (state) {
        return Text(
          state.isSignUp
              ? LocalKeys.pagesAuthPageSignStateTitleSignUp.appExt.locale.toTr
              : LocalKeys.pagesAuthPageSignStateTitleSignIn.appExt.locale.toTr,
          style: context.ext.theme.textTheme.displaySmall?.copyWith(
            fontWeight: FontWeight.w500,
          ),
        );
      },
    );
  }

  Widget get _firstAndLastNameFields {
    return _stateToWidget(
      (state) {
        return Row(
          children: [
            Expanded(
              child: _firstNameField,
            ),
            context.ext.sizedBox.width.sm,
            Expanded(
              child: _lastNameField,
            ),
          ],
        );
      },
    );
  }

  AppTextField get _firstNameField {
    return AppTextField(
      controller: _firstNameController,
      focusNode: _firstNameFocusNode,
      keyboardType: TextInputType.name,
      onFieldSubmitted: (_) => _lastNameFocusNode.requestFocus(),
      hintText: LocalKeys.pagesAuthFieldsSignUpFirstNameHint.appExt.locale.toTr,
      validator: validateFirstName,
      autofillHints: const [AutofillHints.givenName],
    );
  }

  AppTextField get _lastNameField {
    return AppTextField(
      controller: _lastNameController,
      focusNode: _lastNameFocusNode,
      keyboardType: TextInputType.name,
      onFieldSubmitted: (_) => _emailFocusNode.requestFocus(),
      hintText: LocalKeys.pagesAuthFieldsSignUpLastNameHint.appExt.locale.toTr,
      validator: validateLastName,
      autofillHints: const [AutofillHints.familyName],
    );
  }

  Widget get _emailField {
    return _stateToWidget(
      (state) {
        return AppTextField(
          controller: _emailController,
          focusNode: _emailFocusNode,
          keyboardType: TextInputType.emailAddress,
          onFieldSubmitted: (_) => _passwordFocusNode.requestFocus(),
          hintText: state.isSignUp
              ? LocalKeys.pagesAuthFieldsSignUpEmailHint.appExt.locale.toTr
              : LocalKeys.pagesAuthFieldsSignInEmailHint.appExt.locale.toTr,
          validator: state.isSignUp ? validateSignUpEmail : validateSignInEmail,
          autofillHints: const [AutofillHints.email],
        );
      },
    );
  }

  Widget get _passwordField {
    return _stateToWidget(
      (state) {
        return AppTextField(
          controller: _passwordController,
          focusNode: _passwordFocusNode,
          keyboardType: TextInputType.visiblePassword,
          onFieldSubmitted: (_) {
            if (state.isSignUp) {
              _confirmPasswordFocusNode.requestFocus();
              return;
            }
            _submitFocusNode.requestFocus();
          },
          hintText: state.isSignUp
              ? LocalKeys.pagesAuthFieldsSignUpPasswordHint.appExt.locale.toTr
              : LocalKeys.pagesAuthFieldsSignInPasswordHint.appExt.locale.toTr,
          validator:
              state.isSignUp ? validateSignUpPassword : validateSignInPassword,
          autofillHints: const [AutofillHints.password],
        );
      },
    );
  }

  AppTextField get _confirmPasswordField {
    return AppTextField(
      controller: _confirmPasswordController,
      focusNode: _confirmPasswordFocusNode,
      keyboardType: TextInputType.visiblePassword,
      onFieldSubmitted: (_) {
        _submitFocusNode.requestFocus();
      },
      hintText:
          LocalKeys.pagesAuthFieldsSignUpConfirmPasswordHint.appExt.locale.toTr,
      validator: (value) => validateSignUpConfirmPassword(
        value,
        _passwordController.text,
      ),
    );
  }

  Widget get _forgotPassword {
    return _stateToWidget(
      (state) {
        return Align(
          alignment: Alignment.centerRight,
          child: GestureDetector(
            onTap: state.isBusy ? null : () {},
            child: Text(
              LocalKeys.pagesAuthButtonsForgotPassword.appExt.locale.toTr,
              textAlign: TextAlign.end,
              style: context.ext.theme.textTheme.bodyMedium?.copyWith(
                color: context.extApp.theme.currentThemeColor.primary.color,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        );
      },
    );
  }

  Widget get _submitBtn {
    return _stateToWidget(
      (state) {
        return ElevatedButton(
          focusNode: _submitFocusNode,
          onPressed: state.isBusy ? null : onSubmit,
          child: Text(
            state.isSignUp
                ? LocalKeys.pagesAuthButtonsSubmitSignUp.appExt.locale.toTr
                : LocalKeys.pagesAuthButtonsSubmitSignIn.appExt.locale.toTr,
          ),
        );
      },
    );
  }

  Widget get _haveAccountBtn {
    return _stateToWidget(
      (state) {
        return GestureDetector(
          onTap: state.isBusy ? null : () => _toggleSignUpState,
          child: RichText(
            text: TextSpan(
              text:
                  '${state.isSignUp ? LocalKeys.pagesAuthButtonsHaveAccountHavePart1.appExt.locale.toTr : LocalKeys.pagesAuthButtonsHaveAccountDontHavePart1.appExt.locale.toTr}\t',
              style: context.ext.theme.textTheme.bodyMedium,
              children: [
                TextSpan(
                  text: state.isSignUp
                      ? LocalKeys.pagesAuthButtonsHaveAccountHavePart2.appExt
                          .locale.toTr
                      : LocalKeys.pagesAuthButtonsHaveAccountDontHavePart2
                          .appExt.locale.toTr,
                  style: context.ext.theme.textTheme.bodyMedium?.copyWith(
                    color: context.extApp.theme.currentThemeColor.primary.color,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _stateToWidget(Widget Function(AuthPageState state) callback) {
    return BlocBuilder<AuthPageCubit, AuthPageState>(
      bloc: _authPageCubit,
      builder: (_, state) {
        return callback(state);
      },
    );
  }
}
