import 'package:photoplay/Features/home/data/models/movie_model.dart';
import 'package:dartz/dartz.dart';
import 'package:photoplay/Features/search/data/repos/search_repo.dart';
import 'package:photoplay/core/failures/failures.dart';

class SearchRepoImpl implements SearchRepo {
  @override
  Future<Either<ServerFailure, List<MovieModel>>> fetchSearchData(
      {required String q}) {
    // TODO: implement fetchSearchData
    throw UnimplementedError();
  }
}
