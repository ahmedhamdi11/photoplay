import 'package:dartz/dartz.dart';
import 'package:photoplay/Features/home/data/models/movie_model.dart';
import 'package:photoplay/core/failures/failures.dart';

abstract class SearchRepo {
  Future<Either<ServerFailure, List<MovieModel>>> fetchMoviesSearchData(
      {required String q});
  Future<Either<ServerFailure, List<MovieModel>>> fetchTvShowsSearchData(
      {required String q});
}
