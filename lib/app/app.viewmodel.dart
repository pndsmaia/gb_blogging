import 'package:flutter_modular/flutter_modular.dart';
import 'package:gbblogging/libraries/sessao/usecase/get_local_user.usecase.dart';
import 'package:mobx/mobx.dart';
part 'app.viewmodel.g.dart';

class AppViewModel = _AppViewModelBase with _$AppViewModel;

abstract class _AppViewModelBase with Store {
  GetLocalUserUsecase _getLocalUserUsecase = Modular.get();

  Future<bool> get isUserLogged async {
    return await _getLocalUserUsecase.execute();
  }
}
