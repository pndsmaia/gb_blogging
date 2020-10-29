import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:gbblogging/app/app.module.dart';

class InitAppModuleHelper extends IModularTest {
  final ModularTestType modularTestType;

  InitAppModuleHelper(this.modularTestType);

  @override
  List<Bind> get binds => [];

  @override
  ChildModule get module => AppModule();

  @override
  IModularTest get modulardependency => null;
}
