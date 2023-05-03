import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:photoplay/Features/home/data/models/movie_model.dart';
import 'package:photoplay/Features/home/presentation/views/widgets/trending_item.dart';

class TrendingList extends StatelessWidget {
  const TrendingList({
    super.key,
    required this.trendingMovies,
  });

  final List<MovieModel> trendingMovies;
  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: trendingMovies.length,
      itemBuilder: (context, index, realIndex) => TrendingItem(
        trendingMovie: trendingMovies[index],
      ),
      options: CarouselOptions(
          autoPlay: true,
          height: MediaQuery.of(context).size.height * 0.605,
          autoPlayInterval: const Duration(seconds: 7),
          viewportFraction: 1),
    );
  }
}
