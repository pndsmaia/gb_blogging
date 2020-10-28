import 'package:flutter_modular/flutter_modular.dart';
import 'package:gbblogging/libraries/common/usecase_interface/usecases.interface.dart';
import 'package:gbblogging/libraries/sessao/data/session.repository.dart';

class SignInUsecase
    implements IRequestResultUsecase<Map<String, String>, void> {
  SessionRepository _sessionRepository = Modular.get();
  @override
  Future<bool> execute(Map<String, String> data) async {
    try {
      if (await _sessionRepository.signInOrSignUpUser(
              email: data['email'], password: data['password']) !=
          null) return true;
      return false;
    } catch (e) {
      print('ERROR TO SIGN IN OR REGISTER');
    }
    return false;
  }

  @override
  void dispose() {}
}
