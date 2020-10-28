import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gbblogging/libraries/sessao/model/user.model.dart';

abstract class ISessionRepository extends Disposable {
  Future<UserCredential> signInOrSignUpUser(
      {@required String email, @required String password, bool signUp: false});
  Future<bool> saveUser();
  User get getLocalUser;
  Future<UserModel> get getUser;
  Future<void> signOut();
}
