part of 'cast_cubit.dart';

abstract class CastStates {}

class CastInitialState extends CastStates {}

class GetCastLoadingState extends CastStates {}

class GetCastSuccessState extends CastStates {
  final List<CastModel> cast;

  GetCastSuccessState(this.cast);
}

class GetCastFailureState extends CastStates {
  final String errMessage;

  GetCastFailureState(this.errMessage);
}

class GetCastDetailsLoadingState extends CastStates {}

class GetCastDetailsSuccessState extends CastStates {
  final CastModel castDetails;

  GetCastDetailsSuccessState(this.castDetails);
}

class GetCastDetailsFailureState extends CastStates {
  final String errMessage;

  GetCastDetailsFailureState(this.errMessage);
}
