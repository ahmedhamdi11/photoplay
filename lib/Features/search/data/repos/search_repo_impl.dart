import 'package:dio/dio.dart';
import 'package:photoplay/Features/home/data/models/movie_model.dart';
import 'package:dartz/dartz.dart';
import 'package:photoplay/Features/search/data/repos/search_repo.dart';
import 'package:photoplay/constants.dart';
import 'package:photoplay/core/failures/failures.dart';

class SearchRepoImpl implements SearchRepo {
  Dio dio = Dio();

  @override
  Future<Either<ServerFailure, List<MovieModel>>> fetchMoviesSearchData(
      {required String q}) async {
    try {
      var response =
          await dio.get('$kBaseUrl/search/movie?api_key=$kApiKey&query=$q');
      List<MovieModel> searchData = [];
      for (int i = 0; i < response.data['results'].length; i++) {
        searchData.add(MovieModel.fromJson(response.data['results'][i]));
      }
      return right(searchData);
    } catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDio(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
