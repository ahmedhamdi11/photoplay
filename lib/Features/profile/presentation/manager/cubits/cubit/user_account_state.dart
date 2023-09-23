part of 'user_account_cubit.dart';

class UserAccountState extends Equatable {
  const UserAccountState();

  @override
  List<Object> get props => [];
}

class UserAccountInitial extends UserAccountState {}

class UpdateUserDataLoadingState extends UserAccountState {}

class UpdateUserDataSuccessState extends UserAccountState {
  final String successMessaege;

  const UpdateUserDataSuccessState(this.successMessaege);
}

class UpdateUserDataFailureState extends UserAccountState {
  final String errMessage;

  const UpdateUserDataFailureState(this.errMessage);
}
