import 'package:flutter_modular/flutter_modular.dart';
import 'package:gbblogging/features/home/data/news.repository.dart';
import 'package:gbblogging/features/home/data/news.repository.interface.dart';
import 'package:gbblogging/features/home/ui/home.viewmodel.dart';
import 'package:gbblogging/features/home/usecase/get_boti_news.usecase.dart';
import 'package:gbblogging/libraries/common/constants.dart';
import 'package:gbblogging/libraries/network/network.repository.dart';

import '../ui/home.view.dart';

class HomeModule extends ChildModule {
  List<Bind> viewmodels = [
    Bind<HomeViewModel>((i) => HomeViewModel()),
  ];

  List<Bind> usecases = [
    Bind<GetBotiNewsUsecase>((i) => GetBotiNewsUsecase()),
  ];

  List<Bind> repositories = [
    Bind<NetworkRepository>((i) => NetworkRepository(URL_BASE)),
    Bind<INewsRepository>((i) => NewsRepository()),
  ];

  @override
  List<Bind> get binds => viewmodels + repositories + usecases;

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => HomeView(), transition: TransitionType.fadeIn, duration: Duration(milliseconds: 500)),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
