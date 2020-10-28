import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FbAuth {
  static final FirebaseAuth fbAuthInstance = FirebaseAuth.instance;

  static Future<UserCredential> signUpUser(
      {@required String email, @required String password}) async {
    try {
      return await fbAuthInstance.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
      return null;
    } catch (e) {
      print('ERROR TO REGISTER USER IN FIREBASE: \n$e');
      return null;
    }
  }

  static Future<UserCredential> signIn(
      {@required String email, @required String password}) async {
    try {
      return await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
      return null;
    }
  }
}
