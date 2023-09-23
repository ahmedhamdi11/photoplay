import 'package:dartz/dartz.dart';
import 'package:photoplay/core/failures/failures.dart';

abstract class UserAccountRepo {
  Future<Either<Failure, String>> updateUserData({required String userName});
}
