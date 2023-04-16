import 'package:bloc/bloc.dart';
import 'package:photoplay/Features/auth/data/auth_repo.dart';

part 'sign_out_state.dart';

class SignOutCubit extends Cubit<SignOutStates> {
  SignOutCubit({required this.authRepo}) : super(SignOutInitialState());
  AuthRepo authRepo;
  Future signOut() async {
    emit(SignOutLoadingState());

    var result = await authRepo.signOut();

    result.fold((failure) {
      emit(SignOutFailureState(failure.errMessage));
    }, (success) {
      emit(SignOutSuccessState(success));
    });
  }
}
