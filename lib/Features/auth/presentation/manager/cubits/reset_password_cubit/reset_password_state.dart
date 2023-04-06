part of 'reset_password_cubit.dart';

abstract class ResetPasswordStates {}

class ResetPasswordInitialState extends ResetPasswordStates {}

class ResetPasswordLoadingState extends ResetPasswordStates {}

class ResetPasswordSuccessState extends ResetPasswordStates {
  final String successMessage;

  ResetPasswordSuccessState(this.successMessage);
}

class ResetPasswordFailureState extends ResetPasswordStates {
  final String errMessage;

  ResetPasswordFailureState(this.errMessage);
}
