import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:photoplay/Features/home/presentation/views/widgets/search_movies.dart';
import 'package:photoplay/Features/home/presentation/views/widgets/search_tv_shows.dart';
import 'package:photoplay/core/widgets/custom_text_feild.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Padding(
          padding: EdgeInsets.only(top: 60, left: 36, right: 36),
          child: CustomTextField(
            autofocus: true,
            suffix: Icon(FontAwesomeIcons.magnifyingGlass),
            hint: 'Search',
          ),
        ),
        SizedBox(
          height: 26.0,
        ),
        SearchTVShows(),
        SizedBox(
          height: 26.0,
        ),
        SearchMovies(),
      ],
    );
  }
}
