import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:photoplay/core/failures/failures.dart';

abstract class UserAccountRepo {
  Future<Either<Failure, String>> updateUserName({required String userName});
  Future<Either<Failure, String>> updateProfileImage({required File imageFile});
}
