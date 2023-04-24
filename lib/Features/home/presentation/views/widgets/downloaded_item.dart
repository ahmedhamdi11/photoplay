import 'package:flutter/material.dart';
import 'package:photoplay/core/utils/styles.dart';

class DownloadedItem extends StatelessWidget {
  const DownloadedItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 26),
      child: Row(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.41,
            child: AspectRatio(
              aspectRatio: 3 / 1.7,
              child: Image.asset(
                'assets/images/test_image2.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 10.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Narcos',
                style: Styles.text15m,
              ),
              const SizedBox(
                height: 4.0,
              ),
              Text(
                '4 Episodes | 5.02GB',
                style:
                    Styles.text12b.copyWith(color: Colors.white.withAlpha(67)),
              ),
            ],
          )
        ],
      ),
    );
  }
}
