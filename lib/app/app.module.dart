import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:gbblogging/app/app.viewmodel.dart';
import 'package:gbblogging/app/app.widget.dart';
import 'package:gbblogging/app/ui/splash/splash.view.dart';
import 'package:gbblogging/features/home/modules/home.module.dart';
import 'package:gbblogging/features/login/modules/login.module.dart';
import 'package:gbblogging/libraries/session/data/session.repository.dart';
import 'package:gbblogging/libraries/session/usecase/get_local_user.usecase.dart';

class AppModule extends MainModule {
  List<Bind> viewmodels = [
    Bind<AppViewModel>((i) => AppViewModel()),
  ];

  List<Bind> repositories = [
    Bind<SessionRepository>((i) => SessionRepository()),
  ];

  List<Bind> usecases = [
    Bind<GetLocalUserUsecase>((i) => GetLocalUserUsecase()),
  ];

  @override
  List<Bind> get binds => viewmodels + repositories + usecases;

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => SplashView()),
        ModularRouter('/home', module: HomeModule()),
        ModularRouter('/login', module: LoginModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
