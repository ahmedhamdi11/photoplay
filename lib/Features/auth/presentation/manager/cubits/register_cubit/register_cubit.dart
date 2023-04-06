import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:photoplay/Features/auth/data/auth_repo.dart';

part 'register_states.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit({required this.authRepo}) : super(RegisterInitialState());
  AuthRepo authRepo;
  String? firstName;
  String? lastName;
  String? email;
  String? password;
  File? imageFile;
  registerUser() async {
    emit(RegisterLoadingState());
    var result = await authRepo.registerUser(
      email: email!,
      password: password!,
      firstName: firstName!,
      lastName: lastName!,
      imageFile: imageFile,
    );
    result.fold((failure) {
      emit(RegisterFailureState(failure.errMessage));
    }, (userCredential) {
      emit(RegisterSuccessState(userCredential));
    });
  }
}
