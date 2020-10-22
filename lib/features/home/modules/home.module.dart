import 'package:flutter_modular/flutter_modular.dart';
import 'package:gbblogging/features/home/ui/home.viewmodel.dart';

import '../ui/home.view.dart';

class HomeModule extends ChildModule {
  List<Bind> viewmodels = [
    Bind<HomeViewModel>((i) => HomeViewModel()),
  ];

  @override
  List<Bind> get binds => viewmodels;

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => HomeView()),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
