import 'package:flutter/material.dart';

class AppTextField extends StatefulWidget {
  const AppTextField({
    required this.controller,
    required this.hintText,
    required this.focusNode,
    required this.keyboardType,
    super.key,
    this.validator,
    this.autofillHints,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
    this.onChanged,
    this.onFieldSubmitted,
    this.onTap,
    this.initialValue,
    this.readOnly = false,
    this.prefixIcon,
  });

  final TextEditingController controller;
  final String hintText;
  final FocusNode focusNode;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final AutovalidateMode autovalidateMode;
  final Iterable<String>? autofillHints;
  final void Function(String)? onChanged;
  final void Function(String)? onFieldSubmitted;
  final VoidCallback? onTap;
  final String? initialValue;
  final bool readOnly;
  final Widget? prefixIcon;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: widget.validator,
      autovalidateMode: widget.autovalidateMode,
      focusNode: widget.focusNode,
      keyboardType: widget.keyboardType,
      obscuringCharacter: '●',
      autofillHints: widget.autofillHints,
      onChanged: widget.onChanged,
      onFieldSubmitted: widget.onFieldSubmitted,
      onTap: widget.onTap,
      initialValue: widget.initialValue,
      readOnly: widget.readOnly,
      decoration: InputDecoration(
        hintText: widget.hintText,
        prefixIcon: widget.prefixIcon,
      ),
    );
  }
}
