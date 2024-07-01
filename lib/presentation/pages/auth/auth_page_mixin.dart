part of 'auth_page.dart';

mixin AuthPageMixin on State<AuthPage> {
  final AuthPageCubit _authPageCubit = AuthPageCubit();

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  final FocusNode _firstNameFocusNode = FocusNode();
  final FocusNode _lastNameFocusNode = FocusNode();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  final FocusNode _confirmPasswordFocusNode = FocusNode();
  final FocusNode _submitFocusNode = FocusNode();

  @override
  void dispose() {
    _authPageCubit.close();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _firstNameFocusNode.dispose();
    _lastNameFocusNode.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    _confirmPasswordFocusNode.dispose();
    _submitFocusNode.dispose();
    super.dispose();
  }

  void get _toggleSignUpState => _authPageCubit.toggleSignUp();

  void onSubmit() {
    _authPageCubit.changePageState(isBusy: true);

    var isValid = _emailController.value.selection.isValid;
    isValid = isValid && _passwordController.value.selection.isValid;

    if (!isValid) {
      _authPageCubit.changePageState(isBusy: false);
      return;
    }

    if (_authPageCubit.state.isSignUp) {
      isValid = isValid && _firstNameController.value.selection.isValid;
      isValid = isValid && _lastNameController.value.selection.isValid;
      isValid = isValid && _confirmPasswordController.value.selection.isValid;

      if (!isValid) {
        _authPageCubit.changePageState(isBusy: false);
        return;
      }

      _authPageCubit.signUp(
        firstName: _firstNameController.text,
        lastName: _lastNameController.text,
        email: _emailController.text,
        password: _passwordController.text,
      );
    } else {
      _authPageCubit.signIn(
        email: _emailController.text,
        password: _passwordController.text,
      );
    }

    _authPageCubit.changePageState(isBusy: false);
  }
}
