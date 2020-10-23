import 'package:flutter_modular/flutter_modular.dart';

abstract class IResultUsecase<TResult> extends Disposable {
  Future<TResult> execute();
}
