import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:photoplay/constants.dart';

class CastDetailsImage extends StatelessWidget {
  const CastDetailsImage({
    super.key,
    required this.imagePath,
  });
  final String? imagePath;
  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) {
        return const LinearGradient(
            colors: [
              Colors.black,
              Colors.white,
              Colors.white,
              Colors.grey,
              Colors.black,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0, 0.1, 0.9, 0.95, 1]).createShader(bounds);
      },
      child: CachedNetworkImage(
        imageUrl: '$kImageBaseUrl/original$imagePath',
        placeholder: (context, url) => const Center(
          child: CircularProgressIndicator(),
        ),
        errorWidget: (context, url, error) => const Icon(Icons.error),
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.55,
        fit: BoxFit.fill,
      ),
    );
  }
}
