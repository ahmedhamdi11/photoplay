import 'package:flutter/material.dart';
import 'package:photoplay/constants.dart';
import 'package:photoplay/core/utils/styles.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.suffix,
    this.hint,
    this.onChanged,
    this.validator,
    this.keyboardType,
    this.isPassword = false,
    this.autofocus = false,
  });
  final Widget? suffix;
  final String? hint;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final bool isPassword;
  final bool autofocus;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      onChanged: onChanged,
      keyboardType: keyboardType,
      cursorColor: kPrimatyColor,
      obscureText: isPassword,
      autofocus: autofocus,
      decoration: InputDecoration(
          isDense: true,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20.0, vertical: 13.0),
          fillColor: const Color(0xff212121),
          filled: true,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide.none),
          suffixIcon: Padding(
            padding: const EdgeInsets.only(right: 20),
            child: suffix,
          ),
          suffixIconConstraints: const BoxConstraints(maxHeight: 42),
          hintText: hint,
          hintStyle: Styles.text17),
    );
  }
}
