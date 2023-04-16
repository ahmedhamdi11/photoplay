import 'dart:async';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:photoplay/Features/auth/data/auth_repo.dart';
import 'package:photoplay/core/failures/failures.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as p;
import 'package:photoplay/core/utils/cash_helper.dart';

class AuthRepoImpl implements AuthRepo {
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
          String? imageUrl = await value.ref.getDownloadURL();
          userCredential.user!.updatePhotoURL(imageUrl);
        });
      }
      userCredential.user!.updateDisplayName('$firstName $lastName');
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

  @override
  Future<Either<Failure, UserCredential>> googleSignin() async {
    try {
      GoogleSignInAccount? gUser = await GoogleSignIn().signIn();
      GoogleSignInAuthentication? gAuth = await gUser?.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: gAuth?.accessToken,
        idToken: gAuth?.idToken,
      );
      final userCredential =
          await firebaseAuth.signInWithCredential(credential);
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
  Future<Either<Failure, String>> signOut() async {
    try {
      await GoogleSignIn().disconnect();
      await firebaseAuth.signOut();
      await CashHelper.prefs.remove('uId');
      return right('Signed Out');
    } catch (e) {
      if (e is FirebaseAuthException) {
        return left(AuthFailure(e.message.toString()));
      } else {
        return left(AuthFailure(e.toString()));
      }
    }
  }
}
