import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:photoplay/Features/profile/data/repos/user_account_repo/user_account_repo.dart';

part 'user_account_state.dart';

class UserAccountCubit extends Cubit<UserAccountState> {
  UserAccountCubit({required this.userAccountRepo})
      : super(UserAccountInitial());
  UserAccountRepo userAccountRepo;

  Future updateUserData({required String userName}) async {
    emit(UpdateUserDataLoadingState());
    var result = await userAccountRepo.updateUserData(userName: userName);

    result.fold(
      (failure) => emit(UpdateUserDataFailureState(failure.errMessage)),
      (successMessage) => emit(UpdateUserDataSuccessState(successMessage)),
    );
  }
}
