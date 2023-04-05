import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:photoplay/core/utils/styles.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
