import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:photoplay/core/failures/failures.dart';

abstract class AuthRepo {
  loginUser();
  Future<Either<Failure, UserCredential>> registerUser(
      {required String email, required String password});
  resetPassword();
}
