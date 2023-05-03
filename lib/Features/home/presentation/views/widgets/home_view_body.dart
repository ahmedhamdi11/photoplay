import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photoplay/Features/home/presentation/manager/cubits/home_cubit/home_cubit.dart';
import 'package:photoplay/Features/home/presentation/views/widgets/error_view.dart';
import 'package:photoplay/Features/home/presentation/views/widgets/popular_listview.dart';
import 'package:photoplay/Features/home/presentation/views/widgets/trending_movies.dart';
import 'package:photoplay/Features/home/presentation/views/widgets/now_playing_listview.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<HomeCubit>(context);
    return BlocBuilder<HomeCubit, HomeStates>(
      builder: (context, state) {
        if (cubit.popularMovies != null &&
            cubit.nowPlayingMovies != null &&
            cubit.trendingMovies != null) {
          return SafeArea(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  TrendingMovies(
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
                  PopularListView(movies: cubit.popularMovies!),
                  const SizedBox(
                    height: 28.0,
                  ),
                ],
              ),
            ),
          );
        } else if (state is GetPopularMoviesFailureState) {
          return ErrorView(
            errMessage: state.errMessage,
            onPressed: () {
              cubit.getNowPlayingMovies();
              cubit.getPopularMovies();
            },
          );
        } else if (state is GetNowPlayingMoviesFailureState) {
          return ErrorView(
            errMessage: state.errMessage,
            onPressed: () {
              cubit.getNowPlayingMovies();
              cubit.getPopularMovies();
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
