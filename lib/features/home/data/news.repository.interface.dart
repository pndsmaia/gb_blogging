import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gbblogging/features/home/model/news.model.dart';

abstract class INewsRepository implements Disposable {
  Future<Response> getNews();
  Future<void> addOrUpdateNews(NewsModel news);
  Future<void> deleteNews(NewsModel news);
  Future<List<NewsModel>> get getCommunityNews;
}
