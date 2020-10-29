import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_modular/src/interfaces/child_module.dart';
import 'package:flutter_modular/src/inject/bind.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gbblogging/features/login/modules/login.module.dart';
import '../../../app/app.module.helper.dart';

class InitHomeModuleHelper extends IModularTest {
  @override
  List<Bind> get binds => [];

  @override
  ChildModule get module => LoginModule();

  @override
  IModularTest get modulardependency =>
      InitAppModuleHelper(ModularTestType.keepModulesOnMemory);
}
