part of 'get_more_movies_cubit.dart';

abstract class GetMoreMoviesStates {
  const GetMoreMoviesStates();
}

class GetMoreMoviesInitialState extends GetMoreMoviesStates {}

class GetMoreMoviesLoadingState extends GetMoreMoviesStates {}

class GetMoreMoviesSuccessState extends GetMoreMoviesStates {
  final List<MovieModel> movies;

  GetMoreMoviesSuccessState(this.movies);
}

class GetMoreMoviesFailureState extends GetMoreMoviesStates {
  final String errMessage;

  GetMoreMoviesFailureState(this.errMessage);
}
