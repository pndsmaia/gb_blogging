// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home.viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeViewModel on _HomeViewModelBase, Store {
  final _$loadingAtom = Atom(name: '_HomeViewModelBase.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  final _$botiNewsAtom = Atom(name: '_HomeViewModelBase.botiNews');

  @override
  BotiNewsModel get botiNews {
    _$botiNewsAtom.reportRead();
    return super.botiNews;
  }

  @override
  set botiNews(BotiNewsModel value) {
    _$botiNewsAtom.reportWrite(value, super.botiNews, () {
      super.botiNews = value;
    });
  }

  final _$userNameAtom = Atom(name: '_HomeViewModelBase.userName');

  @override
  String get userName {
    _$userNameAtom.reportRead();
    return super.userName;
  }

  @override
  set userName(String value) {
    _$userNameAtom.reportWrite(value, super.userName, () {
      super.userName = value;
    });
  }

  final _$communityNewsAtom = Atom(name: '_HomeViewModelBase.communityNews');

  @override
  ObservableList<NewsModel> get communityNews {
    _$communityNewsAtom.reportRead();
    return super.communityNews;
  }

  @override
  set communityNews(ObservableList<NewsModel> value) {
    _$communityNewsAtom.reportWrite(value, super.communityNews, () {
      super.communityNews = value;
    });
  }

  final _$getBotiNewsAsyncAction =
      AsyncAction('_HomeViewModelBase.getBotiNews');

  @override
  Future<void> getBotiNews() {
    return _$getBotiNewsAsyncAction.run(() => super.getBotiNews());
  }

  final _$getCommunityNewsAsyncAction =
      AsyncAction('_HomeViewModelBase.getCommunityNews');

  @override
  Future<void> getCommunityNews() {
    return _$getCommunityNewsAsyncAction.run(() => super.getCommunityNews());
  }

  final _$getUserNameAsyncAction =
      AsyncAction('_HomeViewModelBase.getUserName');

  @override
  Future<void> getUserName() {
    return _$getUserNameAsyncAction.run(() => super.getUserName());
  }

  final _$_HomeViewModelBaseActionController =
      ActionController(name: '_HomeViewModelBase');

  @override
  void setLoading() {
    final _$actionInfo = _$_HomeViewModelBaseActionController.startAction(
        name: '_HomeViewModelBase.setLoading');
    try {
      return super.setLoading();
    } finally {
      _$_HomeViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loading: ${loading},
botiNews: ${botiNews},
userName: ${userName},
communityNews: ${communityNews}
    ''';
  }
}
