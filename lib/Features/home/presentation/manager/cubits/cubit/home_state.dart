part of 'home_cubit.dart';

abstract class HomeStates {}

class HomeInitialState extends HomeStates {}

class ChangeBNavigationBarState extends HomeStates {}

class GetNowPlayingMoviesLoadingState extends HomeStates {}

class GetNowPlayingMoviesSuccessState extends HomeStates {
  final List<MovieModel> movie;

  GetNowPlayingMoviesSuccessState(this.movie);
}

class GetNowPlayingMoviesFailureState extends HomeStates {
  final String errMessage;

  GetNowPlayingMoviesFailureState(this.errMessage);
}
