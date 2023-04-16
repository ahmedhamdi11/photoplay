import 'package:flutter/material.dart';

showLoadingAlert({required BuildContext context}) {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) => AlertDialog(
      content: Row(
        children: [
          const CircularProgressIndicator(),
          Container(
            margin: const EdgeInsets.only(left: 12.0),
            child: const Text('Loading'),
          )
        ],
      ),
    ),
  );
}
