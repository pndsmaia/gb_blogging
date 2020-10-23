import 'package:flutter_modular/flutter_modular.dart';

abstract class IRequestResultUsecase<TRequest, TResult>
    extends Disposable {
  Future<TResult> execute(TRequest request);
}
