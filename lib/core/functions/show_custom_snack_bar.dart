import 'package:flutter/material.dart';
import 'package:photoplay/core/utils/styles.dart';

showCustomSnackBar({
  required BuildContext context,
  required String content,
  required Color backgroundColor,
  Color textColor = Colors.white,
}) {
  SnackBar mySnackBar = SnackBar(
    content: Text(
      content,
      style: Styles.text14m.copyWith(color: textColor),
    ),
    backgroundColor: backgroundColor,
  );
  ScaffoldMessenger.of(context).showSnackBar(mySnackBar);
}
