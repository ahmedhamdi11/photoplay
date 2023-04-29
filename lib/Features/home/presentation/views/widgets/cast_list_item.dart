import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:photoplay/Features/home/data/models/movie_model.dart';
import 'package:photoplay/constants.dart';
import 'package:photoplay/core/utils/styles.dart';

class CastListItem extends StatelessWidget {
  const CastListItem({
    super.key,
    required this.movie,
  });

  final MovieModel movie;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 12.0),
      child: Column(
        children: [
          SizedBox(
            height: 145,
            child: AspectRatio(
              aspectRatio: 2 / 3,
              child: CachedNetworkImage(
                imageUrl: '$kImageBaseUrl/w300${movie.posterPath}',
                placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
          ),
          const SizedBox(
            height: 4.0,
          ),
          SizedBox(
            width: 70,
            child: Text(
              'name',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: Styles.text12b,
            ),
          )
        ],
      ),
    );
  }
}
