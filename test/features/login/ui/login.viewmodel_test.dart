import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gbblogging/features/login/ui/login.viewmodel.dart';
import 'package:gbblogging/libraries/session/data/session.repository.dart';
import 'package:gbblogging/libraries/session/usecase/sign_in.usecase.dart';

import '../mocks/session.mock.repository.dart';
import '../mocks/sign_in.mock.usecase.dart';
import '../modules/login.module.helper.dart';

void main() {
  test('SIGN IN WITH NULL VALUES', () async {
    InitHomeModuleHelper().load(changeBinds: [
      Bind<SignInUsecase>((i) => SignInUsecaseWithNullMock()),
      Bind<SessionRepository>((i) => SessionRepositoryMock()),
    ]);
    final LoginViewmodel viewmodel = Modular.get();

    expect(await viewmodel.signIn(email: null, password: null), false);
  });

  test('SIGN IN WRONG WITH VALUES', () async {
    InitHomeModuleHelper().load(changeBinds: [
      Bind<SignInUsecase>((i) => SignInUsecaseMock()),
    ]);

    final LoginViewmodel viewmodel = Modular.get();

    expect(await viewmodel.signIn(email: 'teste@boti.com', password: '1234'), false);
  });

  test('SIGN IN WITH VALUES', () async {
    InitHomeModuleHelper().load(changeBinds: [
      Bind<SignInUsecase>((i) => SignInUsecaseMock()),
    ]);

    final LoginViewmodel viewmodel = Modular.get();

    expect(await viewmodel.signIn(email: 'teste@boti.com', password: '123456'), true);
  });
}
