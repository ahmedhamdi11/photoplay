import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:photoplay/core/utils/styles.dart';

class FavoriteItem extends StatelessWidget {
  const FavoriteItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 26),
      child: Row(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.18,
            child: AspectRatio(
              aspectRatio: 2 / 3,
              child: CachedNetworkImage(
                imageUrl:
                    'https://cdn11.bigcommerce.com/s-ydriczk/images/stencil/1280x1280/products/89058/93685/Joker-2019-Final-Style-steps-Poster-buy-original-movie-posters-at-starstills__62518.1669120603.jpg?c=2', // imageUrl: '$kImageBaseUrl/w300${movie.posterPath}',
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
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: Text(
                        'Joker',
                        style: Styles.text15m,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(
                      width: 4.0,
                    ),
                    Text(
                      '(media type)',
                      style: Styles.text11.copyWith(
                          color: Colors.grey, fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 4.0,
                ),
                Text(
                  'overview ;alskdjfa;lskdfja;lsdkfja;sdklfja;sdklfja;sdklfja;sdklfja;sdklfja;sdklfja;sdlkf',
                  style: Styles.text12b
                      .copyWith(color: Colors.white.withAlpha(67)),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
