import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:photoplay/core/utils/styles.dart';

class SocialLogins extends StatelessWidget {
  const SocialLogins({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(
              width: 100,
              child: Divider(
                endIndent: 16.0,
                color: Colors.white.withOpacity(0.36),
              ),
            ),
            Text(
              'Social Logins',
              style: Styles.text14m,
            ),
            SizedBox(
              width: 100,
              child: Divider(
                indent: 16.0,
                color: Colors.white.withOpacity(0.36),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 16.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset('assets/images/Facebook button.svg'),
            const SizedBox(
              width: 25.0,
            ),
            SvgPicture.asset('assets/images/Google button.svg'),
          ],
        ),
      ],
    );
  }
}
