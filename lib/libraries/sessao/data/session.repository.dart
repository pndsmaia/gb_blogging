import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gbblogging/libraries/firebase/firebase.auth.dart';
import 'package:gbblogging/libraries/firebase/firebase.network.dart';
import 'package:gbblogging/libraries/sessao/data/session.interface.repository.dart';
import 'package:gbblogging/libraries/sessao/model/user.model.dart';

class SessionRepository implements ISessionRepository {
  @override
  Future<UserCredential> signInOrSignUpUser({
    @required String email,
    @required String password,
    bool signUp = false,
  }) {
    if (signUp) {
      return FbAuth.signUpUser(email: email, password: password);
    } else {
      return FbAuth.signIn(email: email, password: password);
    }
  }

  @override
  Future<bool> saveUser({@required String name}) async {
    User userFb = getLocalUser;
    UserModel user = UserModel(
      id: userFb.uid,
      name: name,
      email: userFb.email,
      profilePicture: userFb.photoURL,
    );
    try {
      await FbNetwork.insertOrUpdateDocument(
        collectionName: 'users',
        docId: '${user.id}',
        data: user.toMap(),
      );
      return true;
    } catch (e) {
      print('ERROR TO SAVE USER IN CLOUDSTORE FB:\n$e');
    }
    return false;
  }

  User get getLocalUser {
    return FbAuth.fbAuthInstance.currentUser;
  }

  Future<UserModel> get getUser async {
    User localUser = getLocalUser;
    UserModel user;
    UserModel.fromMap(
      await FbNetwork.getDocument(
        collectionName: 'users',
        docId: '${localUser.uid}',
      ),
    );
    return user;
  }

  @override
  Future<void> signOut() async {
    await FbAuth.fbAuthInstance.signOut();
  }

  @override
  void dispose() {}
}
