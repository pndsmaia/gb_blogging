import 'package:flutter_modular/flutter_modular.dart';
import 'package:gbblogging/features/home/data/news.repository.dart';
import 'package:gbblogging/features/home/model/message.model.dart';
import 'package:gbblogging/features/home/model/news.model.dart';
import 'package:gbblogging/libraries/common/usecase_interface/usecases.interface.dart';
import 'package:gbblogging/libraries/session/data/session.repository.dart';

class AddNewsUsecase implements IRequestResultUsecase<String, void> {
  NewsRepository _newsRepository = Modular.get();
  SessionRepository _sessionRepository = Modular.get();

  @override
  Future<void> execute(String newsContent) async {
    NewsModel news = NewsModel(message: MessageModel());
    try {
      news.user = await _sessionRepository.getUser;
      news.message.content = newsContent;
      news.message.createdAt = DateTime.now();
      await _newsRepository.addOrUpdateNews(news);
    } catch (e) {
      print('ERROR TO SAVE NEWS IN FB CLOUD FIRESTORE:\n$e');
    }
  }

  @override
  void dispose() {}
}
