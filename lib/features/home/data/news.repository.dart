import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gbblogging/features/home/data/news.repository.interface.dart';
import 'package:gbblogging/features/home/model/news.model.dart';
import 'package:gbblogging/libraries/firebase/firebase.network.dart';
import 'package:gbblogging/libraries/network/network.repository.dart';

class NewsRepository implements INewsRepository {
  final NetworkRepository _networkRepository = Modular.get();

  @override
  Future<Response> getNews() async {
    return await _networkRepository.getRequest('/data.json');
  }

  Future<void> addOrUpdateNews(NewsModel news) async {
    FbNetwork.insertOrUpdateDocument(
      collectionName: 'news',
      docId: '${news.user.name}_${news.message.createdAt}',
      data: news.toMap(),
    );
  }

  Future<List<NewsModel>> get getCommunityNews async {
    List<NewsModel> news = [];
    List<QueryDocumentSnapshot> listData =
        await FbNetwork.getListDocuments('news');

    listData.forEach((data) {
      news.add(NewsModel.fromMap(data.data()));
    });
    return news;
  }

  @override
  Future<void> deleteNews(NewsModel news) async {
    await FbNetwork.deleteDocument(
      collectionName: 'news',
      docId: '${news.user.name}_${news.message.createdAt}',
    );
  }

  @override
  void dispose() {}
}
