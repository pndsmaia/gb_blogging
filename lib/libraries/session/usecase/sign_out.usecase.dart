import 'package:flutter_modular/flutter_modular.dart';
import 'package:gbblogging/libraries/common/usecase_interface/usecases.interface.dart';
import 'package:gbblogging/libraries/session/data/session.repository.dart';

class SignOutUsecase implements IResultUsecase {
  SessionRepository _sessionRepository = Modular.get();

  @override
  Future<bool> execute() async {
    try {
      await _sessionRepository.signOut();
      return true;
    } catch (e) {
      print('ERROR TO TRY SIGN OUT:\n$e');
      return false;
    }
  }

  @override
  void dispose() {}
}
