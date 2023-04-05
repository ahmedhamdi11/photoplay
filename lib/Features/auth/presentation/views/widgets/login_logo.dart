import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:photoplay/core/utils/styles.dart';

class LoginLogo extends StatelessWidget {
  const LoginLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.2,
        ),
        SvgPicture.asset('assets/images/logo.svg'),
        const SizedBox(
          height: 10.0,
        ),
        Text(
          'PHOTOPLAY',
          style: Styles.text16,
        ),
      ],
    );
  }
}
