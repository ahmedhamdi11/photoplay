part of 'trailers_cubit.dart';

abstract class TrailersStates {
  const TrailersStates();
}

class TrailersInitialState extends TrailersStates {}

class GetMovieTrailerLoadingState extends TrailersStates {}

class GetMovieTrailerSuccessState extends TrailersStates {}

class GetMovieTrailerFailureState extends TrailersStates {
  final String errMessage;

  GetMovieTrailerFailureState(this.errMessage);
}
