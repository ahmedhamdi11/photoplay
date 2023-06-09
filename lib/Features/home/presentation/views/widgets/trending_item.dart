import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:photoplay/Features/home/data/models/movie_model.dart';
import 'package:photoplay/constants.dart';
import 'package:photoplay/core/cubits/theme_cubit/theme_cubit.dart';
import 'package:photoplay/core/functions/get_genres.dart';
import 'package:photoplay/core/functions/shader_mask_colors.dart';
import 'package:photoplay/core/utils/app_router.dart';
import 'package:photoplay/core/utils/styles.dart';

class TrendingItem extends StatelessWidget {
  const TrendingItem({
    super.key,
    required this.trendingMovie,
  });

  final MovieModel trendingMovie;
  @override
  Widget build(BuildContext context) {
    bool isDarkTheme = BlocProvider.of<ThemeCubit>(context).isDarkTheme;
    List<double> shaderStopsList = [0, 0.04, 0.05, 0.91, 0.94, 1];

    return InkWell(
      onTap: () {
        GoRouter.of(context)
            .push(AppRouter.movieDetailsViewPath, extra: trendingMovie);
      },
      child: Column(
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              ShaderMask(
                blendMode: BlendMode.dstOut,
                shaderCallback: (bounds) {
                  return LinearGradient(
                    colors: shaderMaskColors(isDarkTheme),
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: shaderStopsList,
                  ).createShader(bounds);
                },
                child: CachedNetworkImage(
                  imageUrl:
                      '$kImageBaseUrl/original${trendingMovie.posterPath}',
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.5,
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.4,
                child: Text(
                  trendingMovie.title!,
                  style: Styles.text19m,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 14,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: Text(
                  '${trendingMovie.mediaType}   | ${getGenres(genreIds: trendingMovie.genreIds)}',
                  style: Styles.text12m,
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
