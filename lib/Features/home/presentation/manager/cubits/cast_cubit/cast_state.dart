part of 'cast_cubit.dart';

abstract class CastStates {}

class CastInitialState extends CastStates {}

class GetMovieCastLoadingState extends CastStates {}

class GetMovieCastSuccessState extends CastStates {
  final List<CastModel> movieCast;

  GetMovieCastSuccessState(this.movieCast);
}

class GetMovieCastFailureState extends CastStates {
  final String errMessage;

  GetMovieCastFailureState(this.errMessage);
}