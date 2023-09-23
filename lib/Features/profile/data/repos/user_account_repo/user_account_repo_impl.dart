import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:photoplay/Features/profile/data/repos/user_account_repo/user_account_repo.dart';
import 'package:photoplay/core/failures/failures.dart';

class UserAccountRepoImpl implements UserAccountRepo {
  User currentUser = FirebaseAuth.instance.currentUser!;
  @override
  Future<Either<Failure, String>> updateUserName(
      {required String userName}) async {
    try {
      await currentUser.updateDisplayName(userName);
      return right('Updated Successfully');
    } catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDio(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, String>> updateProfileImage(
      {required File imageFile}) async {
    final storage = FirebaseStorage.instance;
    final storageRef =
        storage.ref().child('profile_images/profile_image_${currentUser.uid}');

    try {
      // Delete the old image if it exists
      final oldImageUrl = currentUser.photoURL;
      if (oldImageUrl != null && oldImageUrl.isNotEmpty) {
        final oldImageRef = storage.refFromURL(oldImageUrl);
        await oldImageRef.delete();
      }

      // upload and update profile image with the new one
      await storageRef.putFile(imageFile).then((value) async {
        String imageUrl = await value.ref.getDownloadURL();
        await currentUser.updatePhotoURL(imageUrl);
      });

      return right('Updated Successfully');
    } catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDio(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
