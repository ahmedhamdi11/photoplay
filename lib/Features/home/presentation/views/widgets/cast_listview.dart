import 'package:flutter/material.dart';
import 'package:photoplay/Features/home/data/models/cast_model.dart';
import 'package:photoplay/Features/home/presentation/views/widgets/cast_list_item.dart';
import 'package:photoplay/core/utils/styles.dart';

class CastListView extends StatelessWidget {
  const CastListView({
    super.key,
    required this.movieCast,
  });

  final List<CastModel> movieCast;

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
                itemCount: movieCast.length,
                itemBuilder: (context, index) {
                  return CastListItem(
                    movieCast: movieCast[index],
                  );
                }),
          ),
        ],
      ),
    );
  }
}
