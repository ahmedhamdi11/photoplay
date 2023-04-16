import 'package:bloc/bloc.dart';
import 'package:photoplay/Features/auth/data/auth_repo.dart';

part 'social_signin_state.dart';

class SocialSignInCubit extends Cubit<SocialSignInStates> {
  SocialSignInCubit({required this.authRepo})
      : super(SocialSignInInitialState());
  AuthRepo authRepo;

  Future signInWithGoogle() async {
    emit(GoogleSignInLoadingState());
    var result = await authRepo.googleSignin();

    result.fold(
      (failure) {
        emit(GoogleSignInFailureState(failure.errMessage));
      },
      (userCredential) {
        emit(GoogleSignInSuccessState());
      },
    );
  }
}
