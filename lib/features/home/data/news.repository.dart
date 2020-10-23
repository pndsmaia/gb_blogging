import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gbblogging/features/home/data/news.repository.interface.dart';
import 'package:gbblogging/libraries/network/network.repository.dart';

class NewsRepository implements INewsRepository {
  final NetworkRepository _networkFactory = Modular.get();

  @override
  Future<Response> getNews() async {
    return await _networkFactory.getRequest('/data.json');
  }

  @override
  void dispose() {}
}
