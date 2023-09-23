import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:photoplay/Features/profile/data/repos/user_account_repo/user_account_repo.dart';
import 'package:photoplay/core/failures/failures.dart';

class UserAccountRepoImpl implements UserAccountRepo {
  User currentUser = FirebaseAuth.instance.currentUser!;
  @override
  Future<Either<Failure, String>> updateUserData(
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
}
