part of 'favorites_cubit.dart';

abstract class FavoritesStates {
  const FavoritesStates();
}

class FavoritesInitialState extends FavoritesStates {}

//add to favorites states
class AddOrRemoveFavoritesLoadingState extends FavoritesStates {}

class AddToFavoritesSuccessState extends FavoritesStates {
  final String success;

  AddToFavoritesSuccessState(this.success);
}

class RemoveFavoriteSuccessState extends FavoritesStates {
  final String success;

  RemoveFavoriteSuccessState(this.success);
}

class AddOrRemoveFavoritesFailureState extends FavoritesStates {
  final String errMessage;

  AddOrRemoveFavoritesFailureState(this.errMessage);
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
