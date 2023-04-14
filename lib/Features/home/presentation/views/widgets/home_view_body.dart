import 'package:flutter/material.dart';
import 'package:photoplay/Features/home/presentation/views/widgets/watchin_listview.dart';
import 'package:photoplay/constants.dart';
import 'package:photoplay/core/utils/styles.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ShaderMask(
            shaderCallback: (bounds) {
              return const LinearGradient(
                  colors: [
                    Colors.white,
                    Colors.white,
                    Colors.black,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0, 0.94, 1]).createShader(bounds);
            },
            child: Image.asset(
              'assets/images/test_image1.png',
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.6,
              fit: BoxFit.cover,
            ),
          ),
          Text(
            '6.0',
            style: Styles.text33,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.star_rounded, color: kPrimatyColor),
              Icon(Icons.star_rounded, color: kPrimatyColor),
              Icon(Icons.star_rounded, color: kPrimatyColor),
              Icon(Icons.star_border_rounded, color: kPrimatyColor),
              Icon(Icons.star_border_rounded, color: kPrimatyColor),
            ],
          ),
          const SizedBox(
            height: 14,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Movie   | Family   | Comedy   | Adventure',
                style: Styles.text12m,
              )
            ],
          ),
          const SizedBox(
            height: 28.0,
          ),
          const WatchingListView(),
          const SizedBox(
            height: 28.0,
          ),
        ],
      ),
    );
  }
}
