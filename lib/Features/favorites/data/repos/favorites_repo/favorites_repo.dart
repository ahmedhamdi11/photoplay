import 'package:dartz/dartz.dart';
import 'package:photoplay/core/failures/failures.dart';

abstract class FavoritesRepo {
  Future<Either<Failure, String>> addToFavorites(
      {required Map<String, dynamic> favoriteItem});
}
