import 'package:flutter_modular/flutter_modular.dart';
import 'package:gbblogging/libraries/common/usecase_interface/usecases.interface.dart';
import 'package:gbblogging/libraries/session/data/session.repository.dart';

class GetLocalUserUsecase implements IResultUsecase {
  SessionRepository _sessionRepository = Modular.get();

  @override
  Future<bool> execute() async {
    try {
      if (_sessionRepository.getLocalUser != null) return true;
      return false;
    } catch (e) {
      print('ERROR TO TRY GET LOCAL USER:\n$e');
      return false;
    }
  }

  @override
  void dispose() {}
}
