import 'package:flutter/material.dart';
import 'package:photoplay/core/utils/styles.dart';

showCustomSnackBar({
  required BuildContext context,
  required String content,
  required Color backgroundColor,
}) {
  SnackBar mySnackBar = SnackBar(
    content: Text(
      content,
      style: Styles.text14m.copyWith(color: Colors.white),
    ),
    backgroundColor: backgroundColor,
  );
  ScaffoldMessenger.of(context).showSnackBar(mySnackBar);
}
