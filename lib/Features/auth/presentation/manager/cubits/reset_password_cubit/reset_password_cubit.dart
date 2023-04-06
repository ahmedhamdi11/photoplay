import 'package:bloc/bloc.dart';
import 'package:photoplay/Features/auth/data/auth_repo.dart';

part 'reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordStates> {
  ResetPasswordCubit({required this.authRepo})
      : super(ResetPasswordInitialState());
  final AuthRepo authRepo;
  String? email;
  Future resetPassword() async {
    emit(ResetPasswordLoadingState());
    var result = await authRepo.resetPassword(email: email!);
    result.fold((failure) {
      emit(ResetPasswordFailureState(failure.errMessage));
    }, (successMessage) {
      emit(ResetPasswordSuccessState(successMessage));
    });
  }
}
