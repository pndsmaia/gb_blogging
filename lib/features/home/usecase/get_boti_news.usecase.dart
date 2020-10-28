import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gbblogging/features/home/data/news.repository.dart';
import 'package:gbblogging/features/home/model/boti_news.model.dart';
import 'package:gbblogging/libraries/common/usecase_interface/usecases.interface.dart';

class GetBotiNewsUsecase implements IResultUsecase {
  final NewsRepository _newsRepository = Modular.get();
  @override
  Future<BotiNewsModel> execute() async {
    Response response;
    BotiNewsModel botiNews;

    try {
      response = await _newsRepository.getNews();
    } catch (e) {
      print('ERROR TO GET BOTI NEWS:\n$e');
    }

    if (response?.data != null) {
      botiNews = BotiNewsModel.fromMap(response.data);
      botiNews.news = botiNews.news.reversed.toList();
    }

    return botiNews;
  }

  @override
  void dispose() {}
}
