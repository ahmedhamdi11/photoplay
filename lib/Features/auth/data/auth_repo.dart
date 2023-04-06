import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:photoplay/core/failures/failures.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserCredential>> loginUser({
    required String email,
    required String password,
  });
  Future<Either<Failure, UserCredential>> registerUser({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    required File? imageFile,
  });
  resetPassword();
}
