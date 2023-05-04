import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:photoplay/Features/favorites/data/repos/favorites_repo/favorites_repo.dart';
import 'package:photoplay/Features/home/data/models/movie_model.dart';
import 'package:photoplay/core/failures/failures.dart';

class FavoritesRepoImpl implements FavoritesRepo {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  User? currentUser = FirebaseAuth.instance.currentUser;

  @override
  Future<Either<Failure, String>> addToFavorites(
      {required Map<String, dynamic> favoriteItem}) async {
    try {
      await firebaseFirestore
          .collection('Users')
          .doc(currentUser!.uid)
          .collection('Favorites')
          .add(favoriteItem);
      return right('added to favorites');
    } catch (e) {
      if (e is FirebaseException) {
        return left(ServerFailure(e.message.toString()));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<MovieModel>>> getFavorites() async {
    try {
      var response = await firebaseFirestore
          .collection('Users')
          .doc(currentUser!.uid)
          .collection('Favorites')
          .get();
      List<MovieModel> movies = [];
      for (int i = 0; i < response.docs.length; i++) {
        movies.add(MovieModel.fromJson(response.docs[i]));
      }
      return right(movies);
    } catch (e) {
      if (e is FirebaseException) {
        return left(ServerFailure(e.message.toString()));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
