import 'package:flutter_modular/flutter_modular.dart';
import 'package:gbblogging/features/home/model/boti_news.model.dart';
import 'package:gbblogging/features/home/usecase/get_boti_news.usecase.dart';
import 'package:mobx/mobx.dart';
part 'home.viewmodel.g.dart';

class HomeViewModel = _HomeViewModelBase with _$HomeViewModel;

abstract class _HomeViewModelBase with Store {
  final GetBotiNewsUsecase _getBotiNewsUsecase = Modular.get();

  @observable
  BotiNewsModel botiNews = BotiNewsModel();

  @action
  Future<void> getBotiNews() async {
    botiNews = await _getBotiNewsUsecase.execute();
  }
}
