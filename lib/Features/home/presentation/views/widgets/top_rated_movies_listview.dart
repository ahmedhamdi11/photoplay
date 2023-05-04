import 'package:flutter/material.dart';
import 'package:photoplay/Features/home/data/models/movie_model.dart';
import 'package:photoplay/Features/home/presentation/views/widgets/movies_list_item.dart';
import 'package:photoplay/core/utils/styles.dart';

class TopRatedMoviesListView extends StatelessWidget {
  const TopRatedMoviesListView({
    super.key,
    required this.movies,
  });
  final List<MovieModel> movies;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Top Rated',
            style: Styles.text15b,
          ),
          const SizedBox(
            height: 12.0,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.175,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemCount: movies.length,
              itemBuilder: (context, index) => MoviesListItem(
                movie: movies[index],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
