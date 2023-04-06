part of 'login_cubit.dart';

abstract class LoginStates {}

class LoginInitialState extends LoginStates {}

class LoginLoadingState extends LoginStates {}

class LoginSuccessState extends LoginStates {
  final UserCredential userCredential;

  LoginSuccessState(this.userCredential);
}

class LoginFailureState extends LoginStates {
  final String errMessage;

  LoginFailureState(this.errMessage);
}
