import 'package:flutter_modular/flutter_modular.dart';
import 'package:gbblogging/features/home/data/news.repository.dart';
import 'package:gbblogging/features/home/model/news.model.dart';
import 'package:gbblogging/libraries/common/usecase_interface/usecases.interface.dart';

class UpdateNewsUsecase implements IRequestResultUsecase<NewsModel, void> {
  NewsRepository _newsRepository = Modular.get();

  @override
  Future<void> execute(NewsModel news) async {
    try {
      await _newsRepository.addOrUpdateNews(news);
    } catch (e) {
      print('ERROR TO SAVE NEWS IN FB CLOUD FIRESTORE:\n$e');
    }
  }

  @override
  void dispose() {}
}
