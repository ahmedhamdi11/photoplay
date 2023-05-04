part of 'favorites_cubit.dart';

abstract class FavoritesStates {
  const FavoritesStates();
}

class FavoritesInitialState extends FavoritesStates {}

class AddToFavoritesLoadingState extends FavoritesStates {}

class AddToFavoritesSuccessState extends FavoritesStates {
  final String success;

  AddToFavoritesSuccessState(this.success);
}

class AddToFavoritesFailureState extends FavoritesStates {
  final String errMessage;

  AddToFavoritesFailureState(this.errMessage);
}
