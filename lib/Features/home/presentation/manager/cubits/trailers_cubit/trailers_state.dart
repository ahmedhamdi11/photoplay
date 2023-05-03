part of 'trailers_cubit.dart';

abstract class TrailersStates {
  const TrailersStates();
}

class TrailersInitialState extends TrailersStates {}

class GetTrailerLoadingState extends TrailersStates {}

class GetTrailerSuccessState extends TrailersStates {}

class GetTrailerFailureState extends TrailersStates {
  final String errMessage;

  GetTrailerFailureState(this.errMessage);
}
