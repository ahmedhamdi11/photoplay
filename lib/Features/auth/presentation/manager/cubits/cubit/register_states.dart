part of 'register_cubit.dart';

abstract class RegisterStates {}

class RegisterInitialState extends RegisterStates {}

class RegisterLoadingState extends RegisterStates {}

class RegisterSuccessState extends RegisterStates {
  final UserCredential userCredential;
  RegisterSuccessState(this.userCredential);
}

class RegisterFailureState extends RegisterStates {
  final String errMessage;
  RegisterFailureState(this.errMessage);
}
