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

class GetTopRatedMoviesLoadingState extends HomeStates {}

class GetTopRatedMoviesSuccessState extends HomeStates {}

class GetTopRatedMoviesFailureState extends HomeStates {
  final String errMessage;

  GetTopRatedMoviesFailureState(this.errMessage);
}
