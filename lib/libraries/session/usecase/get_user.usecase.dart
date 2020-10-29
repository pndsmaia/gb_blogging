import 'package:flutter_modular/flutter_modular.dart';
import 'package:gbblogging/libraries/common/usecase_interface/usecases.interface.dart';
import 'package:gbblogging/libraries/session/data/session.repository.dart';
import 'package:gbblogging/libraries/session/model/user.model.dart';

class GetUserUsecase implements IResultUsecase {
  SessionRepository _sessionRepository = Modular.get();

  @override
  Future<UserModel> execute() async {
    try {
      return await _sessionRepository.getUser;
    } catch (e) {
      print('ERROR TO TRY GET USER:\n$e');
    }
    return null;
  }

  @override
  void dispose() {}
}
