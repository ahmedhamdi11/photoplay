import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:photoplay/Features/auth/data/auth_repo.dart';
import 'package:photoplay/core/failures/failures.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as p;

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
      await FirebaseFirestore.instance.collection('users').add({
        'first_name': firstName,
        'last_name': lastName,
        'email': userCredential.user!.email,
        'userId': userCredential.user!.uid,
        'imageUrl': imageUrl,
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
