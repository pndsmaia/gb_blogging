import 'package:flutter_modular/flutter_modular.dart';
import 'package:gbblogging/features/home/data/news.repository.dart';
import 'package:gbblogging/features/home/model/news.model.dart';
import 'package:gbblogging/libraries/common/usecase_interface/usecases.interface.dart';

class GetCommunityNewsUsecase implements IResultUsecase<List<NewsModel>> {
  NewsRepository _newsRepository = Modular.get();

  @override
  Future<List<NewsModel>> execute() async {
    List<NewsModel> news = [];
    try {
      news = await _newsRepository.getCommunityNews;
      news.sort((a, b) {
        return b.message.createdAt.compareTo(a.message.createdAt);
      });
      return news;
    } catch (e) {
      print('ERROR TO GET NEWS IN FB CLOUD FIRESTORE:\n$e');
    }
    return null;
  }

  @override
  void dispose() {}
}
