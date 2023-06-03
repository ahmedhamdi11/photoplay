import 'package:flutter/material.dart';
import 'package:photoplay/constants.dart';
import 'package:photoplay/core/utils/styles.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({super.key, this.onPressed, required this.btnText});
  final void Function()? onPressed;
  final String btnText;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 44,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 12.0,
          backgroundColor: kPrimatyColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          btnText,
          style: Styles.text14b.copyWith(color: Colors.black),
        ),
      ),
    );
  }
}
