import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photoplay/Features/home/data/models/movie_model.dart';
import 'package:photoplay/Features/home/presentation/manager/cubits/cast_cubit/cast_cubit.dart';
import 'package:photoplay/Features/home/presentation/views/widgets/cast_listview.dart';
import 'package:photoplay/Features/home/presentation/views/widgets/movie_details_image.dart';
import 'package:photoplay/Features/home/presentation/views/widgets/movie_detalis_rating.dart';
import 'package:photoplay/Features/home/presentation/views/widgets/watch_trailer_button.dart';
import 'package:photoplay/core/utils/styles.dart';
import 'package:photoplay/core/widgets/default_back_btn.dart';

class MovieDetailsBody extends StatefulWidget {
  const MovieDetailsBody({super.key, required this.movie});
  final MovieModel movie;

  @override
  State<MovieDetailsBody> createState() => _MovieDetailsBodyState();
}

class _MovieDetailsBodyState extends State<MovieDetailsBody> {
  @override
  void initState() {
    BlocProvider.of<CastCubit>(context).getMovieCast(movieId: widget.movie.id);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              //image
              MovieDetailsImage(movie: widget.movie),

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
                          widget.movie.title!,
                          style: Styles.text19m.copyWith(
                            shadows: [
                              const Shadow(
                                color: Colors.black,
                                blurRadius: 4,
                                offset: Offset(2, 2),
                              ),
                            ],
                          ),
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
          MovieDetalsRating(movie: widget.movie),
          const SizedBox(
            height: 28.0,
          ),

          Expanded(
            child: CupertinoScrollbar(
              thumbVisibility: true,
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    //movie overview
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        widget.movie.overview!,
                        style: Styles.text15bk,
                      ),
                    ),
                    const SizedBox(
                      height: 18.0,
                    ),

                    //watch trailer button
                    WatchTrailerButton(movie: widget.movie),

                    const SizedBox(
                      height: 28.0,
                    ),

                    CastListView(movieId: widget.movie.id),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
