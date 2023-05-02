part of 'home_cubit.dart';

abstract class HomeStates {}

class HomeInitialState extends HomeStates {}

class ChangeBNavigationBarState extends HomeStates {}

class GetNowPlayingMoviesLoadingState extends HomeStates {}

class GetNowPlayingMoviesSuccessState extends HomeStates {}

class GetNowPlayingMoviesFailureState extends HomeStates {
  final String errMessage;

  GetNowPlayingMoviesFailureState(this.errMessage);
}

class GetPopularMoviesLoadingState extends HomeStates {}

class GetPopularMoviesSuccessState extends HomeStates {}

class GetPopularMoviesFailureState extends HomeStates {
  final String errMessage;

  GetPopularMoviesFailureState(this.errMessage);
}
