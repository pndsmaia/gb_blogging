import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gbblogging/features/home/model/news.model.dart';
import 'package:gbblogging/features/home/ui/home.viewmodel.dart';
import 'package:gbblogging/libraries/common/colors.dart';
import 'package:gbblogging/libraries/common/constants.dart';
import 'package:gbblogging/libraries/common/widgets/card.widget.dart';
import 'package:gbblogging/libraries/media_query/media_query_tools.dart';

class BotiNewsView extends StatefulWidget {
  @override
  _BotiNewsViewState createState() => _BotiNewsViewState();
}

class _BotiNewsViewState extends State<BotiNewsView> {
  final HomeViewModel _viewmodel = Modular.get();

  @override
  void initState() {
    _viewmodel.getBotiNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryTools _mediaQuery = MediaQueryTools.of(context);
    return Observer(builder: (_) {
      return Container(
        height: _mediaQuery.height(530),
        child: _viewmodel.loading
            ? Center(
                child: CircularProgressIndicator(
                    backgroundColor: primaryColor[100]),
              )
            : _cardsListView(_mediaQuery, _viewmodel.botiNews.news),
      );
    });
  }

  Widget _cardsListView(MediaQueryTools mediaQuery, List<NewsModel> botiNews) {
    return ListView.builder(
      itemCount: botiNews.length,
      itemBuilder: (_, index) {
        NewsModel news = botiNews[index];
        return CardWidgetBoti(
          imgUrl: news.user.profilePicture != ''
              ? news.user.profilePicture
              : BOTI_LOGO_URL,
          userName: news.user.name,
          descriptionText: news.message.content,
          date: news.message.createdAt,
        );
      },
    );
  }
}
