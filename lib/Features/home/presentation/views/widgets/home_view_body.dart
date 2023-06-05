import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photoplay/Features/home/presentation/manager/cubits/home_cubit/home_cubit.dart';
import 'package:photoplay/core/widgets/error_view.dart';
import 'package:photoplay/Features/home/presentation/views/widgets/top_rated_movies_listview.dart';
import 'package:photoplay/Features/home/presentation/views/widgets/trending_list.dart';
import 'package:photoplay/Features/home/presentation/views/widgets/now_playing_listview.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<HomeCubit>(context);
    return BlocBuilder<HomeCubit, HomeStates>(
      builder: (context, state) {
        if (cubit.topRatedMovies != null &&
            cubit.nowPlayingMovies != null &&
            cubit.trendingMovies != null) {
          return SafeArea(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  TrendingList(
                    trendingMovies: cubit.trendingMovies!,
                  ),
                  const SizedBox(
                    height: 28.0,
                  ),
                  NowPlayingListView(
                    movies: cubit.nowPlayingMovies!,
                  ),
                  const SizedBox(
                    height: 28.0,
                  ),
                  TopRatedMoviesListView(movies: cubit.topRatedMovies!),
                  const SizedBox(
                    height: 28.0,
                  ),
                ],
              ),
            ),
          );
        } else if (state is GetTopRatedMoviesFailureState) {
          return ErrorView(
            errMessage: state.errMessage,
            onPressed: () {
              cubit.getNowPlayingMovies();
              cubit.getTopRatedMovies();
              cubit.getTrendingMovies();
            },
          );
        } else if (state is GetNowPlayingMoviesFailureState) {
          return ErrorView(
            errMessage: state.errMessage,
            onPressed: () {
              cubit.getNowPlayingMovies();
              cubit.getTopRatedMovies();
              cubit.getTrendingMovies();
            },
          );
        } else if (state is GetTrendingMoviesFailureState) {
          return ErrorView(
            errMessage: state.errMessage,
            onPressed: () {
              cubit.getNowPlayingMovies();
              cubit.getTopRatedMovies();
              cubit.getTrendingMovies();
            },
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
