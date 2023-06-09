import 'package:dartz/dartz.dart';
import 'package:photoplay/Features/home/data/models/cast_model.dart';
import 'package:photoplay/Features/home/data/models/movie_model.dart';
import 'package:photoplay/Features/home/data/models/videos_model.dart';
import 'package:photoplay/core/failures/failures.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<MovieModel>>> getNowPlayingMovies();
  Future<Either<Failure, List<MovieModel>>> getMoreNowPlayingMovies(
      {required int pageNum});
  Future<Either<Failure, List<MovieModel>>> getTopRatedMovies();
  Future<Either<Failure, List<MovieModel>>> getMoreTopMovies(
      {required int pageNum});
  Future<Either<Failure, List<MovieModel>>> getTrendingMovies();
  Future<Either<Failure, List<CastModel>>> getMovieCast({required int movieId});
  Future<Either<Failure, List<CastModel>>> getTvCast({required int tvId});
  Future<Either<Failure, CastModel>> getCastDetails({required int castId});
  Future<Either<Failure, List<MovieModel>>> getKnownForList(
      {required int castId});
  Future<Either<Failure, VideosModel>> getMovieTrailer({required int movieId});
  Future<Either<Failure, VideosModel>> getTvTrailer({required int tvId});
}
