import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:photoplay/Features/profile/data/repos/user_account_repo/user_account_repo.dart';

part 'user_account_state.dart';

class UserAccountCubit extends Cubit<UserAccountState> {
  UserAccountCubit({required this.userAccountRepo})
      : super(UserAccountInitial());
  UserAccountRepo userAccountRepo;

  String? userName;
  Future _updateUserName({required String userName}) async {
    emit(UpdateUserDataLoadingState());
    var result = await userAccountRepo.updateUserName(userName: userName);

    result.fold(
      (failure) => emit(UpdateUserDataFailureState(failure.errMessage)),
      (successMessage) => emit(UpdateUserDataSuccessState(successMessage)),
    );
  }

  Future _updateProfileImage({required File imageFile}) async {
    emit(UpdateUserDataLoadingState());
    var result = await userAccountRepo.updateProfileImage(imageFile: imageFile);

    result.fold(
      (failure) => emit(UpdateUserDataFailureState(failure.errMessage)),
      (successMessage) => emit(UpdateUserDataSuccessState(successMessage)),
    );
  }

  Future updateUserData() async {
    if (userName != null && imageFile != null) {
      _updateUserName(userName: userName!);
      _updateProfileImage(imageFile: imageFile!);
    } else if (userName == null && imageFile != null) {
      _updateProfileImage(imageFile: imageFile!);
    } else if (userName != null && imageFile == null) {
      _updateUserName(userName: userName!);
    }
  }

  File? imageFile;
  Future pickeImage() async {
    ImagePicker picker = ImagePicker();
    XFile? xFile = await picker.pickImage(source: ImageSource.gallery);
    if (xFile != null) {
      imageFile = File(xFile.path);
      emit(PickImageState());
    }
  }
}
