import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:photoplay/Features/home/data/models/movie_model.dart';
import 'package:photoplay/constants.dart';
import 'package:photoplay/core/utils/app_router.dart';
import 'package:photoplay/core/utils/styles.dart';

class TrendingItem extends StatelessWidget {
  const TrendingItem({
    super.key,
    required this.trendingMovie,
  });

  final MovieModel trendingMovie;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        GoRouter.of(context)
            .push(AppRouter.movieDetailsViewPath, extra: trendingMovie);
      },
      child: Column(
        children: [
          ShaderMask(
            shaderCallback: (bounds) {
              return const LinearGradient(
                  colors: [
                    Colors.black,
                    Colors.white,
                    Colors.white,
                    Colors.black,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0, 0.1, 0.94, 1]).createShader(bounds);
            },
            child: CachedNetworkImage(
              imageUrl: '$kImageBaseUrl/original${trendingMovie.posterPath}',
              placeholder: (context, url) => const Center(
                child: CircularProgressIndicator(),
              ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.54,
              fit: BoxFit.fill,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.star_rounded, color: kPrimatyColor),
              Text(
                '${trendingMovie.voteAverage.toStringAsFixed(1)}',
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(
                width: 8.0,
              ),
              Text(
                '(${trendingMovie.voteCount})',
                style: Styles.text14m.copyWith(color: Colors.grey),
              ),
            ],
          ),
          const SizedBox(
            height: 14,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${trendingMovie.mediaType}   | Family   | Comedy   | Adventure',
                style: Styles.text12m,
              )
            ],
          ),
        ],
      ),
    );
  }
}
