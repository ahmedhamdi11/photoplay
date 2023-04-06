import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:photoplay/core/utils/styles.dart';

class RegisterAddPicture extends StatelessWidget {
  const RegisterAddPicture({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 50,
          backgroundColor: const Color(0xff1D1D1D),
          child: SvgPicture.asset('assets/images/person.svg'),
        ),
        const SizedBox(
          height: 16.0,
        ),
        Text(
          'Add profile picture',
          style: Styles.text15m,
        ),
      ],
    );
  }
}
