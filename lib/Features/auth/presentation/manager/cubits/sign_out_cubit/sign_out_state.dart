part of 'sign_out_cubit.dart';

abstract class SignOutStates {}

class SignOutInitialState extends SignOutStates {}

class SignOutLoadingState extends SignOutStates {}

class SignOutSuccessState extends SignOutStates {
  final String success;

  SignOutSuccessState(this.success);
}

class SignOutFailureState extends SignOutStates {
  final String errMessage;

  SignOutFailureState(this.errMessage);
}
