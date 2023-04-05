import 'package:flutter/material.dart';

class LoginBackground extends StatelessWidget {
  const LoginBackground({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) {
        return const LinearGradient(
            colors: [
              Colors.black,
              Colors.grey,
              Colors.white,
              Colors.black,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0, .1, .5, 1]).createShader(bounds);
      },
      child: Image.asset(
        'assets/images/loginImage.png',
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.6,
        fit: BoxFit.cover,
      ),
    );
  }
}
