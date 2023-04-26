import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:photoplay/core/widgets/default_button.dart';

class ErrorView extends StatelessWidget {
  const ErrorView({
    super.key,
    required this.errMessage,
    required this.onPressed,
  });
  final String errMessage;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Lottie.asset(
            'assets/lotties/error.json',
            width: MediaQuery.of(context).size.width * .35,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * .5,
            child: Text(
              errMessage,
              style: const TextStyle(color: Colors.grey),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 16.0,
          ),
          SizedBox(
            width: 105,
            child: DefaultButton(onPressed: onPressed, btnText: 'Try Again'),
          )
        ],
      ),
    );
  }
}
