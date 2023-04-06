import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:photoplay/Features/auth/data/auth_repo.dart';
import 'package:photoplay/core/failures/failures.dart';

class AuthRepoImpl implements AuthRepo {
  @override
  loginUser() {
    // TODO: implement loginUser
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, UserCredential>> registerUser({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
  }) async {
    try {
      final userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await FirebaseFirestore.instance.collection('users').add({
        'first_name': firstName,
        'last_name': lastName,
        'email': userCredential.user!.email,
        'userId': userCredential.user!.uid,
      });
      return right(userCredential);
    } catch (e) {
      if (e is FirebaseAuthException) {
        return left(AuthFailure(e.message.toString()));
      } else {
        return left(AuthFailure(e.toString()));
      }
    }
  }

  @override
  resetPassword() {
    // TODO: implement resetPassword
    throw UnimplementedError();
  }
}
