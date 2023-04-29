import 'package:flutter/material.dart';
import 'package:photoplay/Features/home/data/models/movie_model.dart';
import 'package:photoplay/constants.dart';
import 'package:photoplay/core/utils/styles.dart';

class MovieDetalsRating extends StatelessWidget {
  const MovieDetalsRating({
    super.key,
    required this.movie,
  });

  final MovieModel movie;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          Icons.star_rounded,
          color: kPrimatyColor,
          size: 28,
        ),
        Text(
          '${movie.voteAverage.toStringAsFixed(1)}',
          style: Styles.text33,
        ),
        const SizedBox(
          width: 8.0,
        ),
        Text(
          '(${movie.voteCount})',
          style: Styles.text14m.copyWith(color: Colors.grey),
        ),
      ],
    );
  }
}
