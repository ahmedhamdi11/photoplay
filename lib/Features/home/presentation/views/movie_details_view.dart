import 'package:flutter/material.dart';
import 'package:photoplay/Features/home/data/models/movie_model.dart';
import 'package:photoplay/Features/home/presentation/views/widgets/movie_details_body.dart';

class MovieDetailsView extends StatelessWidget {
  const MovieDetailsView({super.key, required this.movie});
  final MovieModel movie;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MovieDetailsBody(
        movie: movie,
      ),
    );
  }
}
