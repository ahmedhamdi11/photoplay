import 'package:flutter/material.dart';
import 'package:photoplay/core/utils/styles.dart';

showCustomSnackBar({
  required BuildContext context,
  required String content,
  required Color backgroundColor,
  Color textColor = Colors.white,
}) {
  SnackBar mySnackBar = SnackBar(
    duration: const Duration(seconds: 3),
    behavior: SnackBarBehavior.floating,
    margin: const EdgeInsets.only(bottom: 70.0, left: 12.0, right: 12.0),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12.0),
    ),
    content: Text(
      content,
      style: Styles.text14m.copyWith(color: textColor),
    ),
    backgroundColor: backgroundColor,
  );
  ScaffoldMessenger.of(context).showSnackBar(mySnackBar);
}
