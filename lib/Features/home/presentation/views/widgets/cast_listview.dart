import 'package:flutter/material.dart';
import 'package:photoplay/Features/home/data/models/movie_model.dart';
import 'package:photoplay/Features/home/presentation/views/widgets/cast_list_item.dart';
import 'package:photoplay/core/utils/styles.dart';

class CastListView extends StatelessWidget {
  const CastListView({
    super.key,
    required this.movie,
  });

  final MovieModel movie;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Cast',
            style: Styles.text15b,
          ),
          const SizedBox(
            height: 12.0,
          ),
          SizedBox(
            height: 180,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return CastListItem(movie: movie);
                }),
          ),
        ],
      ),
    );
  }
}
