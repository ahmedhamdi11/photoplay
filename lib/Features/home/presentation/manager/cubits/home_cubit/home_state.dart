part of 'home_cubit.dart';

abstract class HomeStates {}

class HomeInitialState extends HomeStates {} //initial state

// The Navigation bar State
class ChangeBNavigationBarState extends HomeStates {}

// Now Playing States
class GetNowPlayingMoviesSuccessState extends HomeStates {}

class GetNowPlayingMoviesFailureState extends HomeStates {
  final String errMessage;

  GetNowPlayingMoviesFailureState(this.errMessage);
}

// Top Rated States
class GetTopRatedMoviesSuccessState extends HomeStates {}

class GetTopRatedMoviesFailureState extends HomeStates {
  final String errMessage;

  GetTopRatedMoviesFailureState(this.errMessage);
}

// Trending states
class GetTrendingMoviesSuccessState extends HomeStates {}

class GetTrendingMoviesFailureState extends HomeStates {
  final String errMessage;

  GetTrendingMoviesFailureState(this.errMessage);
}
