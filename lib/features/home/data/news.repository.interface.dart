import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

abstract class INewsRepository implements Disposable {
  Future<Response> getNews();
}
