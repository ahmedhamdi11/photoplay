import 'package:dio/dio.dart';
import 'package:photoplay/Features/home/data/models/cast_model.dart';
import 'package:photoplay/Features/home/data/models/movie_model.dart';
import 'package:dartz/dartz.dart';
import 'package:photoplay/Features/home/data/models/videos_model.dart';
import 'package:photoplay/Features/home/data/repos/home_repo.dart';
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
        return left(ServerFailure.fromDio(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<MovieModel>>> getMoreNowPlayingMovies(
      {required int pageNum}) async {
    try {
      var response = await dio
          .get('$kBaseUrl/movie/now_playing?page=$pageNum&api_key=$kApiKey');
      List<MovieModel> movies = [];
      for (int i = 0; i < response.data['results'].length; i++) {
        movies.add(MovieModel.fromJson(response.data['results'][i]));
      }
      return right(movies);
    } catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDio(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<MovieModel>>> getTopRatedMovies() async {
    try {
      var response =
          await dio.get('$kBaseUrl/movie/top_rated?api_key=$kApiKey');
      List<MovieModel> movies = [];
      for (int i = 0; i < response.data['results'].length; i++) {
        movies.add(MovieModel.fromJson(response.data['results'][i]));
      }
      return right(movies);
    } catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDio(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<MovieModel>>> getMoreTopMovies(
      {required int pageNum}) async {
    try {
      var response = await dio
          .get('$kBaseUrl/movie/top_rated?page=$pageNum&api_key=$kApiKey');
      List<MovieModel> movies = [];
      for (int i = 0; i < response.data['results'].length; i++) {
        movies.add(MovieModel.fromJson(response.data['results'][i]));
      }
      return right(movies);
    } catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDio(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<MovieModel>>> getTrendingMovies() async {
    try {
      var response =
          await dio.get('$kBaseUrl/trending/all/week?api_key=$kApiKey');
      List<MovieModel> movies = [];
      for (int i = 0; i < response.data['results'].length; i++) {
        movies.add(MovieModel.fromJson(response.data['results'][i]));
      }
      return right(movies);
    } catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDio(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<CastModel>>> getMovieCast(
      {required int movieId}) async {
    try {
      var response =
          await dio.get('$kBaseUrl/movie/$movieId/credits?api_key=$kApiKey');
      List<CastModel> movieCast = [];
      for (int i = 0; i < response.data['cast'].length; i++) {
        movieCast.add(CastModel.fromJson(response.data['cast'][i]));
      }
      return right(movieCast);
    } catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDio(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<CastModel>>> getTvCast(
      {required int tvId}) async {
    try {
      var response =
          await dio.get('$kBaseUrl/tv/$tvId/credits?api_key=$kApiKey');
      List<CastModel> tvCast = [];
      for (int i = 0; i < response.data['cast'].length; i++) {
        tvCast.add(CastModel.fromJson(response.data['cast'][i]));
      }
      return right(tvCast);
    } catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDio(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, CastModel>> getCastDetails(
      {required int castId}) async {
    try {
      var response = await dio.get('$kBaseUrl/person/$castId?api_key=$kApiKey');
      CastModel castDetails = CastModel.fromJson(response.data);

      return right(castDetails);
    } catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDio(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<MovieModel>>> getKnownForList(
      {required int castId}) async {
    try {
      var response = await dio
          .get('$kBaseUrl/person/$castId/combined_credits?api_key=$kApiKey');
      List<MovieModel> movies = [];
      for (int i = 0; i < response.data['cast'].length; i++) {
        movies.add(MovieModel.fromJson(response.data['cast'][i]));
      }
      return right(movies);
    } catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDio(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, VideosModel>> getMovieTrailer(
      {required int movieId}) async {
    try {
      var respons =
          await dio.get('$kBaseUrl/movie/$movieId/videos?api_key=$kApiKey');
      List<VideosModel> movieVideos = [];
      for (int i = 0; i < respons.data['results'].length; i++) {
        movieVideos.add(VideosModel.fromJson(respons.data['results'][i]));
      }
      List<VideosModel> trailerVideos = movieVideos
          .where((e) => e.type == 'Trailer' && e.site == 'YouTube')
          .toList();
      if (trailerVideos.isEmpty) {
        return left(ServerFailure('sorry trailer not found'));
      } else {
        return right(trailerVideos[0]);
      }
    } catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDio(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, VideosModel>> getTvTrailer({required int tvId}) async {
    try {
      var respons = await dio.get('$kBaseUrl/tv/$tvId/videos?api_key=$kApiKey');
      List<VideosModel> tvVideos = [];
      for (int i = 0; i < respons.data['results'].length; i++) {
        tvVideos.add(VideosModel.fromJson(respons.data['results'][i]));
      }
      List<VideosModel> trailerVideos = tvVideos
          .where((e) => e.type == 'Trailer' && e.site == 'YouTube')
          .toList();
      if (trailerVideos.isEmpty) {
        return left(ServerFailure('sorry trailer not found'));
      } else {
        return right(trailerVideos[0]);
      }
    } catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDio(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
