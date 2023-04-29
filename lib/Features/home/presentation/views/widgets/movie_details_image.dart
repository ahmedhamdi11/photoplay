import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:photoplay/Features/home/data/models/movie_model.dart';
import 'package:photoplay/constants.dart';

class MovieDetailsImage extends StatelessWidget {
  const MovieDetailsImage({
    super.key,
    required this.movie,
  });

  final MovieModel movie;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) {
        return const LinearGradient(
            colors: [
              Colors.black,
              Colors.white,
              Colors.white,
              Colors.grey,
              Colors.black,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0, 0.1, 0.9, 0.95, 1]).createShader(bounds);
      },
      child: CachedNetworkImage(
        imageUrl: '$kImageBaseUrl/original${movie.backdropPath}',
        placeholder: (context, url) => const Center(
          child: CircularProgressIndicator(),
        ),
        errorWidget: (context, url, error) => const Icon(Icons.error),
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.3,
        fit: BoxFit.fill,
      ),
    );
  }
}
