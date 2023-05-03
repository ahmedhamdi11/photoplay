part of 'search_cubit.dart';

abstract class SearchStates {
  const SearchStates();
}

class SearchInitialState extends SearchStates {}

class SearchLoadingState extends SearchStates {}

class SearchSuccessState extends SearchStates {}

class SearchFailureState extends SearchStates {
  final String errMessage;

  SearchFailureState(this.errMessage);
}
