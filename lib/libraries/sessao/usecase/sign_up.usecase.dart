import 'package:flutter_modular/flutter_modular.dart';
import 'package:gbblogging/libraries/common/usecase_interface/usecases.interface.dart';
import 'package:gbblogging/libraries/sessao/data/session.repository.dart';
import 'package:gbblogging/libraries/sessao/model/user.model.dart';

class SignUpUsecase
    implements IRequestResultUsecase<Map<String, dynamic>, void> {
  SessionRepository _sessionRepository = Modular.get();
  @override
  Future<bool> execute(Map<String, dynamic> data) async {
    UserModel user = data['user'];
    try {
      await _sessionRepository.signInOrSignUpUser(
          email: user.email, password: data['password'], signUp: true);
      await _sessionRepository.saveUser(name: user.name);
      return true;
    } catch (e) {
      print('ERROR TO SIGN IN OR REGISTER');
    }
    return false;
  }

  @override
  void dispose() {}
}
