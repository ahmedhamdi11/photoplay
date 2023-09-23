import 'package:flutter/material.dart';
import 'package:photoplay/Features/home/data/models/movie_model.dart';
import 'package:photoplay/Features/home/presentation/views/widgets/movies_list_item.dart';
import 'package:photoplay/core/utils/styles.dart';

class KnownForListView extends StatelessWidget {
  const KnownForListView({
    super.key,
    required this.movies,
  });
  final List<MovieModel> movies;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Text(
            'Known for',
            style: Styles.text15b,
          ),
        ),
        const SizedBox(
          height: 12.0,
        ),
        SizedBox(
          height: 150,
          child: ListView.builder(
            padding: const EdgeInsets.only(left: 16.0),
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemCount: movies.length,
            itemBuilder: (context, index) => MoviesListItem(
              movie: movies[index],
            ),
          ),
        ),
      ],
    );
  }
}
