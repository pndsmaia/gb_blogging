// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home.viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeViewModel on _HomeViewModelBase, Store {
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

  final _$getBotiNewsAsyncAction =
      AsyncAction('_HomeViewModelBase.getBotiNews');

  @override
  Future<void> getBotiNews() {
    return _$getBotiNewsAsyncAction.run(() => super.getBotiNews());
  }

  @override
  String toString() {
    return '''
botiNews: ${botiNews}
    ''';
  }
}
