import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:photoplay/core/widgets/error_view.dart';
import 'package:photoplay/Features/search/presentation/manager/cubits/search_cubit/search_cubit.dart';
import 'package:photoplay/Features/search/presentation/widgets/search_movies.dart';
import 'package:photoplay/Features/search/presentation/widgets/search_tv_shows.dart';
import 'package:photoplay/core/widgets/custom_text_feild.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    SearchCubit searchCubit = BlocProvider.of<SearchCubit>(context);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 60, left: 36, right: 36),
          child: CustomTextField(
            onChanged: (value) {
              searchCubit.fetchSearchData(q: value);
              searchCubit.fetchTvShowsSearchData(q: value);
            },
            autofocus: true,
            suffix: const Icon(FontAwesomeIcons.magnifyingGlass),
            hint: 'Search',
          ),
        ),
        const SizedBox(
          height: 26.0,
        ),
        BlocBuilder<SearchCubit, SearchStates>(builder: (context, state) {
          if (state is SearchLoadingState) {
            return const Expanded(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else if (state is SearchFailureState) {
            return ErrorView(
              errMessage: state.errMessage,
              withTryAgainBtn: false,
            );
          } else if (searchCubit.moviesSearchData != null &&
              searchCubit.tvShowsSearchData != null) {
            if (searchCubit.moviesSearchData!.isEmpty &&
                searchCubit.tvShowsSearchData!.isEmpty) {
              return const Expanded(
                child: Center(
                  child: Text(
                    'No Results Found',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              );
            } else {
              return Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      if (searchCubit.moviesSearchData!.isNotEmpty)
                        SearchMovies(
                          movies: searchCubit.moviesSearchData!,
                        ),
                      if (searchCubit.moviesSearchData!.isNotEmpty)
                        const SizedBox(
                          height: 26.0,
                        ),
                      if (searchCubit.tvShowsSearchData!.isNotEmpty)
                        SearchTVShows(
                          tvShows: searchCubit.tvShowsSearchData!,
                        ),
                      if (searchCubit.tvShowsSearchData!.isNotEmpty)
                        const SizedBox(
                          height: 26.0,
                        ),
                    ],
                  ),
                ),
              );
            }
          } else if (state is SearchInitialState) {
            return const Center(
              child: Text(
                'serach for tv shows and movies',
                style: TextStyle(color: Colors.grey),
              ),
            );
          }
          return const SizedBox.shrink();
        }),
      ],
    );
  }
}
