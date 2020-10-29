import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gbblogging/libraries/session/model/user.model.dart';
import 'package:gbblogging/libraries/session/usecase/sign_up.usecase.dart';
import 'package:mobx/mobx.dart';
part 'sign_up.viewmodel.g.dart';

class SignUpViewmodel = _SignUpViewmodelBase with _$SignUpViewmodel;

abstract class _SignUpViewmodelBase with Store {
  SignUpUsecase _signUpUsecase = Modular.get();
  @observable
  UserModel user = UserModel();

  String password;

  @action
  setUserModel({
    @required String name,
    @required String email,
    @required String pass,
  }) {
    user.name = name;
    user.email = email;
    password = pass;
  }

  Future<bool> signUp() {
    Map<String, dynamic> data = {'user': user, 'password': password};
    return _signUpUsecase.execute(data);
  }
}
