import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:gbblogging/app/app.viewmodel.dart';
import 'package:gbblogging/app/app.widget.dart';
import 'package:gbblogging/app/ui/splash/splash.view.dart';

class AppModule extends MainModule {
  List<Bind> viewmodels = [
    Bind<AppViewModel>((i) => AppViewModel()),
  ];

  @override
  List<Bind> get binds => viewmodels;

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => SplashView()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
