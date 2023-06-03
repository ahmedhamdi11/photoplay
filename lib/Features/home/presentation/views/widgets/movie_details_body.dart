import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photoplay/Features/favorites/presentation/manager/cubits/favorites_cubit/favorites_cubit.dart';
import 'package:photoplay/Features/home/data/models/movie_model.dart';
import 'package:photoplay/Features/home/presentation/manager/cubits/cast_cubit/cast_cubit.dart';
import 'package:photoplay/Features/home/presentation/views/widgets/cast_listview.dart';
import 'package:photoplay/Features/home/presentation/views/widgets/movie_details_image.dart';
import 'package:photoplay/Features/home/presentation/views/widgets/movie_detalis_rating.dart';
import 'package:photoplay/Features/home/presentation/views/widgets/watch_trailer_button.dart';
import 'package:photoplay/core/cubits/theme_cubit/theme_cubit.dart';
import 'package:photoplay/core/functions/get_genres.dart';
import 'package:photoplay/core/utils/styles.dart';
import 'package:photoplay/core/widgets/default_back_btn.dart';
import 'package:photoplay/core/widgets/favorites_button.dart';

class MovieDetailsBody extends StatefulWidget {
  const MovieDetailsBody({super.key, required this.movie});
  final MovieModel movie;

  @override
  State<MovieDetailsBody> createState() => _MovieDetailsBodyState();
}

class _MovieDetailsBodyState extends State<MovieDetailsBody> {
  @override
  void initState() {
    if (widget.movie.mediaType == 'tv') {
      BlocProvider.of<CastCubit>(context).getTvCast(tvId: widget.movie.id);
    } else {
      BlocProvider.of<CastCubit>(context)
          .getMovieCast(movieId: widget.movie.id);
    }
    BlocProvider.of<FavoritesCubit>(context).getFavorites();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool isDarkTheme = BlocProvider.of<ThemeCubit>(context).isDarkTheme;

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
                bottom: -22,
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
                            color: Colors.white,
                            shadows: [
                              const Shadow(
                                color: Colors.black,
                                blurRadius: 4,
                                offset: Offset(1, 1),
                              ),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(
                        height: 8.0,
                      ),

                      //genrs
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: Row(
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.6,
                              child: Text(
                                '${widget.movie.mediaType ?? 'movie'}   | ${getGenres(genreIds: widget.movie.genreIds)}',
                                style: Styles.text12m,
                              ),
                            ),
                            const Spacer(),

                            //add or remove favorite
                            FavoritesBtn(movie: widget.movie),
                          ],
                        ),
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
              scrollbarOrientation: ScrollbarOrientation.left,
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    //movie overview
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        widget.movie.overview!,
                        style: isDarkTheme
                            ? Styles.text15bk
                            : Styles.text15bk
                                .copyWith(color: const Color(0xff7E7E7E)),
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
