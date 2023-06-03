import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photoplay/Features/home/data/models/movie_model.dart';
import 'package:photoplay/constants.dart';
import 'package:photoplay/core/cubits/theme_cubit/theme_cubit.dart';
import 'package:photoplay/core/functions/shader_mask_colors.dart';

class MovieDetailsImage extends StatelessWidget {
  const MovieDetailsImage({
    super.key,
    required this.movie,
  });

  final MovieModel movie;

  @override
  Widget build(BuildContext context) {
    bool isDarkTheme = BlocProvider.of<ThemeCubit>(context).isDarkTheme;
    List<double> shaderStopsList = [0, 0.04, 0.05, 0.91, 0.94, 1];

    return ShaderMask(
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
        imageUrl: '$kImageBaseUrl/original${movie.backdropPath}',
        placeholder: (context, url) => const Center(
          child: CircularProgressIndicator(),
        ),
        errorWidget: (context, url, error) => const Icon(Icons.error),
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.3,
        fit: BoxFit.fill,
      ),
    );
  }
}
