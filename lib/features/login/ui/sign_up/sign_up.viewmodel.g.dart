// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up.viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SignUpViewmodel on _SignUpViewmodelBase, Store {
  final _$userAtom = Atom(name: '_SignUpViewmodelBase.user');

  @override
  UserModel get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(UserModel value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  final _$_SignUpViewmodelBaseActionController =
      ActionController(name: '_SignUpViewmodelBase');

  @override
  dynamic setUserModel(
      {@required String name, @required String email, @required String pass}) {
    final _$actionInfo = _$_SignUpViewmodelBaseActionController.startAction(
        name: '_SignUpViewmodelBase.setUserModel');
    try {
      return super.setUserModel(name: name, email: email, pass: pass);
    } finally {
      _$_SignUpViewmodelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
user: ${user}
    ''';
  }
}
