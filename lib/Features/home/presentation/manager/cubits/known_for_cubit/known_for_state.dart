part of 'known_for_cubit.dart';

abstract class KnownForStates {
  const KnownForStates();
}

class KnownForInitialSate extends KnownForStates {}

class GetKnownForListLoadingState extends KnownForStates {}

class GetKnownForListSuccessState extends KnownForStates {
  final List<MovieModel> movies;

  GetKnownForListSuccessState(this.movies);
}

class GetKnownForListFailureState extends KnownForStates {
  final String errMessage;

  GetKnownForListFailureState(this.errMessage);
}
