import 'package:flutter_modular/flutter_modular.dart';

abstract class IResultUsecase<TResult> extends Disposable {
  Future<TResult> execute();
}
abstract class IRequestResultUsecase<TRequest, TResult>
    extends Disposable {
  Future<TResult> execute(TRequest request);
}

