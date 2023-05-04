import 'package:flutter/material.dart';
import 'package:photoplay/Features/home/data/models/movie_model.dart';
import 'package:photoplay/Features/home/presentation/views/widgets/movies_list_item.dart';
import 'package:photoplay/core/utils/styles.dart';

class SearchTVShows extends StatelessWidget {
  const SearchTVShows({
    super.key,
    required this.tvShows,
  });
  final List<MovieModel> tvShows;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 18.0),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'TV SHOWS',
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
            height: MediaQuery.of(context).size.height * 0.22,
            child: ListView.builder(
                itemCount: tvShows.length,
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  tvShows[index].mediaType = 'Tv';
                  return Column(
                    children: [
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.18,
                          child: MoviesListItem(movie: tvShows[index])),
                      const SizedBox(
                        height: 4.0,
                      ),
                      SizedBox(
                        width: 70,
                        child: Text(
                          tvShows[index].title ?? '',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: Styles.text12b,
                        ),
                      ),
                    ],
                  );
                }),
          ),
        ],
      ),
    );
  }
}
