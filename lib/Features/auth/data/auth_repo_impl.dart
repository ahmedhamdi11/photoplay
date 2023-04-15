import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:photoplay/Features/auth/data/auth_repo.dart';
import 'package:photoplay/core/failures/failures.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as p;
import 'package:photoplay/core/utils/cash_helper.dart';

class AuthRepoImpl implements AuthRepo {
  String? imageUrl;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  @override
  Future<Either<Failure, UserCredential>> loginUser({
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      CashHelper.prefs.setString('uId', userCredential.user!.uid);
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
  Future<Either<Failure, UserCredential>> registerUser({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    required File? imageFile,
  }) async {
    try {
      final userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (imageFile != null) {
        await FirebaseStorage.instance
            .ref()
            .child('Images/${p.basename(imageFile.path)}')
            .putFile(imageFile)
            .then((value) async {
          imageUrl = await value.ref.getDownloadURL();
        });
      }
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userCredential.user!.uid)
          .set({
        'first_name': firstName,
        'last_name': lastName,
        'email': userCredential.user!.email,
        'userId': userCredential.user!.uid,
        'imageUrl': imageUrl,
      });
      CashHelper.prefs.setString('uId', userCredential.user!.uid);
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
  Future<Either<Failure, String>> resetPassword({required String email}) async {
    try {
      await firebaseAuth.sendPasswordResetEmail(email: email);
      return right('password reset link sent! check you email');
    } catch (e) {
      if (e is FirebaseAuthException) {
        return left(AuthFailure(e.message.toString()));
      } else {
        return left(AuthFailure(e.toString()));
      }
    }
  }
}
