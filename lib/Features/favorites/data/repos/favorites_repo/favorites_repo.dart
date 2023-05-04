import 'package:dartz/dartz.dart';
import 'package:photoplay/Features/home/data/models/movie_model.dart';
import 'package:photoplay/core/failures/failures.dart';

abstract class FavoritesRepo {
  Future<Either<Failure, String>> addToFavorites(
      {required Map<String, dynamic> favoriteItem});

  Future<Either<Failure, List<MovieModel>>> getFavorites();
}
