import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photoplay/Features/home/presentation/manager/cubits/cubit/home_cubit.dart';
import 'package:photoplay/Features/home/presentation/views/widgets/error_view.dart';
import 'package:photoplay/Features/home/presentation/views/widgets/popular_listview.dart';
import 'package:photoplay/Features/home/presentation/views/widgets/watchin_listview.dart';
import 'package:photoplay/constants.dart';
import 'package:photoplay/core/utils/styles.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<HomeCubit>(context);
    return BlocBuilder<HomeCubit, HomeStates>(
      builder: (context, state) {
        if (cubit.popularMovies != null && cubit.nowPlayingMovies != null) {
          return SingleChildScrollView(
            child: Column(
              children: [
                ShaderMask(
                  shaderCallback: (bounds) {
                    return const LinearGradient(
                        colors: [
                          Colors.black,
                          Colors.white,
                          Colors.white,
                          Colors.black,
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: [0, 0.1, 0.94, 1]).createShader(bounds);
                  },
                  child: Image.network(
                    '$kImageBaseUrl/original${cubit.nowPlayingMovies![0].posterPath}',
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.54,
                    fit: BoxFit.cover,
                  ),
                ),
                Text(
                  '${cubit.nowPlayingMovies![0].voteCount}',
                  style: Styles.text33,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.star_rounded, color: kPrimatyColor),
                    Icon(Icons.star_rounded, color: kPrimatyColor),
                    Icon(Icons.star_rounded, color: kPrimatyColor),
                    Icon(Icons.star_border_rounded, color: kPrimatyColor),
                    Icon(Icons.star_border_rounded, color: kPrimatyColor),
                  ],
                ),
                const SizedBox(
                  height: 14,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Movie   | Family   | Comedy   | Adventure',
                      style: Styles.text12m,
                    )
                  ],
                ),
                const SizedBox(
                  height: 28.0,
                ),
                WatchingListView(
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
