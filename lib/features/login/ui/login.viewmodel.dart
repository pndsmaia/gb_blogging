import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gbblogging/libraries/session/usecase/sign_in.usecase.dart';
import 'package:mobx/mobx.dart';
part 'login.viewmodel.g.dart';

class LoginViewmodel = _LoginViewmodelBase with _$LoginViewmodel;

abstract class _LoginViewmodelBase with Store {
  SignInUsecase _signInUsecase = Modular.get();

  Future<bool> signIn({
    @required String email,
    @required String password,
  }) async {
    try {
      return await _signInUsecase
          .execute({'email': email, 'password': password});
    } catch (e) {
      throw (e);
    }
  }
}
