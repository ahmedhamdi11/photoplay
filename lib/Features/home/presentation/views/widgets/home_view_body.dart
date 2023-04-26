import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photoplay/Features/home/presentation/manager/cubits/cubit/home_cubit.dart';
import 'package:photoplay/Features/home/presentation/views/widgets/watchin_listview.dart';
import 'package:photoplay/constants.dart';
import 'package:photoplay/core/utils/styles.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeStates>(
      builder: (context, state) {
        return state is GetNowPlayingMoviesSuccessState
            ? SingleChildScrollView(
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
                        '$kImageBaseUrl/original${state.movie[0].posterPath}',
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * 0.54,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Text(
                      '${state.movie[0].voteCount}',
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
                      movies: state.movie,
                    ),
                    const SizedBox(
                      height: 28.0,
                    ),
                  ],
                ),
              )
            : state is GetNowPlayingMoviesFailureState
                ? Center(child: Text(state.errMessage))
                : const Center(child: CircularProgressIndicator());
      },
    );
  }
}
