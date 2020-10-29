import 'package:flutter_modular/flutter_modular.dart';
import 'package:gbblogging/libraries/session/data/session.repository.dart';
import 'package:gbblogging/libraries/session/usecase/sign_in.usecase.dart';

class SignInUsecaseWithNullMock implements SignInUsecase {
  SessionRepository _sessionRepository = Modular.get();
  @override
  Future<bool> execute(Map<String, String> data) async {
     try {
      if (await _sessionRepository.signInOrSignUpUser(
              email: data['email'], password: data['password']) !=
          null) return true;
      return false;
    } catch (e) {
      print('ERROR TO SIGN IN OR REGISTER:\n$e');
      throw (e);
    }
  }

  @override
  void dispose() {}
}

class SignInUsecaseMock implements SignInUsecase {
  @override
  Future<bool> execute(Map<String, String> data) async {
      if (data['email'] == 'teste@boti.com' && data['password'] == '123456') {
        return true;
      }
      return false;
  }

  @override
  void dispose() {}
}
