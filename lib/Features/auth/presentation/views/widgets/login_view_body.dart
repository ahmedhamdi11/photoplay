import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        ShaderMask(
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
        ),
        Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
            ),
            SvgPicture.asset('assets/images/logo.svg'),
            const SizedBox(
              height: 10.0,
            ),
            const Text(
              'PHOTOPLAY',
              style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Gotham',
                  fontWeight: FontWeight.bold,
                  color: Color(0xffFFBB3B)),
            ),
          ],
        )
      ],
    );
  }
}
