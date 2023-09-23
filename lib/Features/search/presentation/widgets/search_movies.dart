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
    return Column(
      children: [
        Row(
          children: [
            const SizedBox(
              width: 16.0,
            ),
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
          height: MediaQuery.of(context).size.height * 0.23,
          child: ListView.builder(
            padding: const EdgeInsets.only(left: 16.0),
            itemCount: movies.length,
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.18,
                    child: MoviesListItem(movie: movies[index]),
                  ),
                  const SizedBox(
                    height: 4.0,
                  ),
                  SizedBox(
                    width: 70,
                    child: Text(
                      movies[index].title ?? '',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: Styles.text12b,
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
