import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gbblogging/libraries/session/data/session.repository.dart';

class SessionRepositoryMock extends SessionRepository {
  @override
  Future<UserCredential> signInOrSignUpUser({
    @required String email,
    @required String password,
    bool signUp = false,
  }) {
    UserCredential user;
    if (email != null && password != null) {
      return Future.value(user);
    }
    return null;
  }
}
