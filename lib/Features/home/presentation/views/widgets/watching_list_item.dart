import 'package:flutter/material.dart';

class WatchingListItem extends StatelessWidget {
  const WatchingListItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 12.0),
      child: AspectRatio(
        aspectRatio: 2 / 3,
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/images/test_image2.png'),
            ),
          ),
        ),
      ),
    );
  }
}
