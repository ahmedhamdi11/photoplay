import 'package:flutter/material.dart';
import 'package:photoplay/constants.dart';
import 'package:photoplay/core/utils/styles.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key, this.suffix, this.hint, this.onChanged, this.validator});
  final Widget? suffix;
  final String? hint;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      onChanged: onChanged,
      cursorColor: kPrimatyColor,
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
