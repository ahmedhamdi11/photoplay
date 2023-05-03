import 'package:dartz/dartz.dart';
import 'package:photoplay/Features/home/data/models/movie_model.dart';
import 'package:photoplay/core/failures/failures.dart';

abstract class SearchRepo {
  Future<Either<ServerFailure, List<MovieModel>>> fetchSearchData(
      {required String q});
}
