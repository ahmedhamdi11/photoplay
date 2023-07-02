import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:photoplay/Features/home/data/models/movie_model.dart';
import 'package:photoplay/constants.dart';
import 'package:photoplay/core/utils/app_router.dart';
import 'package:photoplay/core/utils/styles.dart';

class MoreMoviesItem extends StatelessWidget {
  const MoreMoviesItem({
    super.key,
    required this.movie,
  });
  final MovieModel movie;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        GoRouter.of(context).push(AppRouter.movieDetailsViewPath, extra: movie);
      },
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          CachedNetworkImage(
            imageUrl: '$kImageBaseUrl/w300${movie.posterPath}',
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
          Container(
            padding: const EdgeInsets.all(4.0),
            decoration: const BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(8.0),
              ),
            ),
            child: Text(
              '${movie.voteAverage}',
              style: Styles.text12m,
            ),
          )
        ],
      ),
    );
  }
}
