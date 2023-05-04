part of 'favorites_cubit.dart';

abstract class FavoritesStates {
  const FavoritesStates();
}

class FavoritesInitialState extends FavoritesStates {}

//add to favorites states
class AddToFavoritesLoadingState extends FavoritesStates {}

class AddToFavoritesSuccessState extends FavoritesStates {
  final String success;

  AddToFavoritesSuccessState(this.success);
}

class AddToFavoritesFailureState extends FavoritesStates {
  final String errMessage;

  AddToFavoritesFailureState(this.errMessage);
}

//get favorites states
class GetFavoritesLoadingState extends FavoritesStates {}

class GetFavoritesSuccessState extends FavoritesStates {
  final List<MovieModel> movies;

  GetFavoritesSuccessState(this.movies);
}

class GetFavoritesFailureState extends FavoritesStates {
  final String errMessage;

  GetFavoritesFailureState(this.errMessage);
}
