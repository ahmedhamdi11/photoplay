import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:photoplay/Features/home/data/models/movie_model.dart';
import 'package:photoplay/constants.dart';
import 'package:photoplay/core/cubits/theme_cubit/theme_cubit.dart';
import 'package:photoplay/core/utils/app_router.dart';
import 'package:photoplay/core/utils/styles.dart';

class FavoriteItem extends StatelessWidget {
  const FavoriteItem({
    super.key,
    required this.movie,
  });
  final MovieModel movie;
  @override
  Widget build(BuildContext context) {
    bool isDarkTheme = BlocProvider.of<ThemeCubit>(context).isDarkTheme;
    return Padding(
      padding: const EdgeInsets.only(bottom: 26),
      child: InkWell(
        onTap: () {
          GoRouter.of(context)
              .push(AppRouter.movieDetailsViewPath, extra: movie);
        },
        child: Row(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.18,
              child: AspectRatio(
                aspectRatio: 2 / 3,
                child: CachedNetworkImage(
                  imageUrl: '$kImageBaseUrl/w300${movie.posterPath}',
                  placeholder: (context, url) =>
                      const Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ),
            const SizedBox(width: 12.0),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.35,
                        child: Text(
                          movie.title ?? '',
                          style: Styles.text15m,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(
                        width: 4.0,
                      ),
                      Text(
                        '(${movie.mediaType ?? 'movie'})',
                        style: Styles.text11.copyWith(
                            color: Colors.grey, fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 4.0,
                  ),
                  Text(
                    movie.overview ?? '',
                    style: isDarkTheme
                        ? Styles.text12b
                            .copyWith(color: Colors.white.withAlpha(67))
                        : Styles.text12b
                            .copyWith(color: Colors.black.withAlpha(67)),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
