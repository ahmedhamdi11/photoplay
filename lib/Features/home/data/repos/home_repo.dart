import 'package:dartz/dartz.dart';
import 'package:photoplay/Features/home/data/models/movie_model.dart';
import 'package:photoplay/Features/home/data/models/trending_model.dart';
import 'package:photoplay/core/failures/failures.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<MovieModel>>> getNowPlayingMovies();
  Future<Either<Failure, List<MovieModel>>> getPopularMovies();
  Future<Either<Failure, List<TrendingModel>>> getTrendingMovies();
}
