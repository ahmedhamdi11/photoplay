import 'package:flutter/material.dart';
import 'package:photoplay/Features/home/data/models/movie_model.dart';
import 'package:photoplay/Features/home/presentation/views/widgets/movies_list_item.dart';
import 'package:photoplay/core/utils/styles.dart';

class SearchMovies extends StatelessWidget {
  const SearchMovies({
    super.key,
    required this.movies,
  });
  final List<MovieModel> movies;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 18.0),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'MOVIES',
                style: Styles.text12m,
              ),
              const Expanded(
                child: Divider(
                  indent: 22.0,
                  endIndent: 18.0,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 16.0,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.18,
            child: ListView.builder(
                itemCount: movies.length,
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return MoviesListItem(movie: movies[index]);
                }),
          ),
        ],
      ),
    );
  }
}
