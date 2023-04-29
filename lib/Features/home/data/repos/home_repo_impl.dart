import 'package:dio/dio.dart';
import 'package:photoplay/Features/home/data/models/movie_model.dart';
import 'package:dartz/dartz.dart';
import 'package:photoplay/Features/home/data/models/trending_model.dart';
import 'package:photoplay/Features/home/data/repos/home_repo.dart';
import 'package:photoplay/Features/home/presentation/views/widgets/trending_item.dart';
import 'package:photoplay/Features/home/presentation/views/widgets/trending_movies.dart';
import 'package:photoplay/constants.dart';
import 'package:photoplay/core/failures/failures.dart';

class HomeRepoImpl implements HomeRepo {
  Dio dio = Dio();
  @override
  Future<Either<Failure, List<MovieModel>>> getNowPlayingMovies() async {
    try {
      var response =
          await dio.get('$kBaseUrl/movie/now_playing?api_key=$kApiKey');
      List<MovieModel> movies = [];
      for (int i = 0; i < response.data['results'].length; i++) {
        movies.add(MovieModel.fromJson(response.data['results'][i]));
      }
      return right(movies);
    } catch (e) {
      if (e is DioError) {
        return left(HomeFailure.fromDio(e));
      }
      return left(HomeFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<MovieModel>>> getPopularMovies() async {
    try {
      var response = await dio.get('$kBaseUrl/movie/popular?api_key=$kApiKey');
      List<MovieModel> movies = [];
      for (int i = 0; i < response.data['results'].length; i++) {
        movies.add(MovieModel.fromJson(response.data['results'][i]));
      }
      return right(movies);
    } catch (e) {
      if (e is DioError) {
        return left(HomeFailure.fromDio(e));
      }
      return left(HomeFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<TrendingModel>>> getTrendingMovies() async {
    try {
      var response =
          await dio.get('$kBaseUrl/trending/all/week?api_key=$kApiKey');
      List<TrendingModel> movies = [];
      for (int i = 0; i < response.data['results'].length; i++) {
        movies.add(TrendingModel.fromJson(response.data['results'][i]));
      }
      return right(movies);
    } catch (e) {
      if (e is DioError) {
        return left(HomeFailure.fromDio(e));
      }
      return left(HomeFailure(e.toString()));
    }
  }
}
