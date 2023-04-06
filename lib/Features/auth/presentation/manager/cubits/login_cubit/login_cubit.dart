import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:photoplay/Features/auth/data/auth_repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit({required this.authRepo}) : super(LoginInitialState());
  AuthRepo authRepo;
  String? email;
  String? password;
  Future loginUser() async {
    emit(LoginLoadingState());
    var result = await authRepo.loginUser(
      email: email!,
      password: password!,
    );
    result.fold((failure) {
      emit(LoginFailureState(failure.errMessage));
    }, (userCredential) {
      emit(LoginSuccessState(userCredential));
    });
  }
}
