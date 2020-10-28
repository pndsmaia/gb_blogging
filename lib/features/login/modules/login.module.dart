import 'package:flutter_modular/flutter_modular.dart';
import 'package:gbblogging/features/home/modules/home.module.dart';
import 'package:gbblogging/features/login/ui/login.view.dart';
import 'package:gbblogging/features/login/ui/login.viewmodel.dart';
import 'package:gbblogging/features/login/ui/sign_up/sign_up.view.dart';
import 'package:gbblogging/features/login/ui/sign_up/sign_up.viewmodel.dart';
import 'package:gbblogging/libraries/sessao/usecase/sign_in.usecase.dart';
import 'package:gbblogging/libraries/sessao/usecase/sign_up.usecase.dart';

class LoginModule extends ChildModule {
  List<Bind> viewmodels = [
    Bind<LoginViewmodel>((i) => LoginViewmodel()),
    Bind<SignUpViewmodel>((i) => SignUpViewmodel()),
  ];

  List<Bind> usecases = [
    Bind<SignInUsecase>((i) => SignInUsecase()),
    Bind<SignUpUsecase>((i) => SignUpUsecase()),
  ];

  @override
  List<Bind> get binds => viewmodels + usecases;

  @override
  List<ModularRouter> get routers => [
        ModularRouter(
          Modular.initialRoute,
          child: (_, args) => LoginView(),
          transition: TransitionType.fadeIn,
          duration: Duration(milliseconds: 500),
        ),
        ModularRouter('/signup', child: (_, args) => SignUpView()),
        ModularRouter('/home', module: HomeModule()),
      ];

  static Inject get to => Inject<LoginModule>.of();
}
