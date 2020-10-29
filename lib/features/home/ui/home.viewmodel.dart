import 'package:flutter_modular/flutter_modular.dart';
import 'package:gbblogging/features/home/model/boti_news.model.dart';
import 'package:gbblogging/features/home/model/news.model.dart';
import 'package:gbblogging/features/home/usecase/add_news.usecase.dart';
import 'package:gbblogging/features/home/usecase/delete_news.usecase.dart';
import 'package:gbblogging/features/home/usecase/get_boti_news.usecase.dart';
import 'package:gbblogging/features/home/usecase/get_community_news.usecase.dart';
import 'package:gbblogging/features/home/usecase/update_news.usecase.dart';
import 'package:gbblogging/libraries/session/model/user.model.dart';
import 'package:gbblogging/libraries/session/usecase/get_user.usecase.dart';
import 'package:gbblogging/libraries/session/usecase/sign_out.usecase.dart';
import 'package:mobx/mobx.dart';
part 'home.viewmodel.g.dart';

class HomeViewModel = _HomeViewModelBase with _$HomeViewModel;

abstract class _HomeViewModelBase with Store {
  final GetBotiNewsUsecase _getBotiNewsUsecase = Modular.get();
  final GetCommunityNewsUsecase _getCommunityNewsUsecase = Modular.get();
  final GetUserUsecase _getUserUsecase = Modular.get();
  final SignOutUsecase _signOutUsecase = Modular.get();
  final AddNewsUsecase _addNewsUsecase = Modular.get();
  final UpdateNewsUsecase _updateNewsUsecase = Modular.get();
  final DeleteNewsUsecase _deleteNewsUsecase = Modular.get();

  @observable
  bool loading = false;

  @observable
  BotiNewsModel botiNews = BotiNewsModel();

  @observable
  String userName = '';

  @observable
  ObservableList<NewsModel> communityNews = ObservableList<NewsModel>();

  @action
  Future<void> getBotiNews() async {
    setLoading();
    botiNews = await _getBotiNewsUsecase.execute();
    setLoading();
  }

  @action
  void setLoading() {
    loading = loading ? false : true;
  }

  Future<bool> signOut() {
    return _signOutUsecase.execute();
  }

  Future<void> addNews(String newsContent) async {
    setLoading();
    await _addNewsUsecase.execute(newsContent);
    await getCommunityNews();
  }

  Future<void> updateNews(NewsModel news) async {
    setLoading();
    await _updateNewsUsecase.execute(news);
    await getCommunityNews();
  }

  Future<void> deleteNews(NewsModel news) async {
    setLoading();
    await _deleteNewsUsecase.execute(news);
    await getCommunityNews();
  }

  @action
  Future<void> getCommunityNews() async {
    if (!loading) setLoading();
    await getUserName();
    communityNews = ObservableList<NewsModel>();
    communityNews.addAll(await _getCommunityNewsUsecase.execute());
    setLoading();
  }

  @action
  Future<void> getUserName() async {
    UserModel user = await _getUserUsecase.execute();
    userName = user.name;
  }
}
