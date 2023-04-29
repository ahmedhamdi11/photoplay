import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photoplay/Features/home/data/models/movie_model.dart';
import 'package:photoplay/Features/home/presentation/manager/cubits/cast_cubit/cast_cubit.dart';
import 'package:photoplay/Features/home/presentation/views/widgets/cast_listview.dart';
import 'package:photoplay/Features/home/presentation/views/widgets/error_view.dart';
import 'package:photoplay/Features/home/presentation/views/widgets/movie_details_image.dart';
import 'package:photoplay/Features/home/presentation/views/widgets/movie_detalis_rating.dart';
import 'package:photoplay/core/utils/styles.dart';
import 'package:photoplay/core/widgets/default_back_btn.dart';
import 'package:photoplay/core/widgets/default_button.dart';

class MovieDetailsBody extends StatelessWidget {
  const MovieDetailsBody({super.key, required this.movie});
  final MovieModel movie;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              //image
              MovieDetailsImage(movie: movie),

              //back btn
              const DefaultBackBtn(),

              //movie title and genrs
              Positioned(
                bottom: -15,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //title
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: Text(
                          movie.title,
                          style: Styles.text19m,
                        ),
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      //genrs
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Movie   | Family   | Comedy   | Adventure',
                            style: Styles.text12m,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 40.0,
          ),

          //rating
          MovieDetalsRating(movie: movie),
          const SizedBox(
            height: 28.0,
          ),

          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  //movie overview
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      movie.overview,
                      style: Styles.text15bk,
                    ),
                  ),
                  const SizedBox(
                    height: 18.0,
                  ),

                  //watch now button
                  SizedBox(
                    width: 160,
                    child:
                        DefaultButton(onPressed: () {}, btnText: 'WATCH NOW'),
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  BlocBuilder<CastCubit, CastStates>(
                    builder: (context, state) {
                      if (state is GetMovieCastSuccessState) {
                        return CastListView(movieCast: state.movieCast);
                      } else if (state is GetMovieCastFailureState) {
                        return ErrorView(
                            errMessage: state.errMessage, onPressed: () {});
                      } else if (state is GetMovieCastLoadingState) {
                        return const Padding(
                          padding: EdgeInsets.only(top: 40),
                          child: CircularProgressIndicator(),
                        );
                      }
                      return const SizedBox.shrink();
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
