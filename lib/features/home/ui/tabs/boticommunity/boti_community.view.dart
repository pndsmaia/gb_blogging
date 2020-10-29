import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gbblogging/features/home/model/news.model.dart';
import 'package:gbblogging/features/home/ui/home.viewmodel.dart';
import 'package:gbblogging/libraries/common/colors.dart';
import 'package:gbblogging/libraries/common/constants.dart';
import 'package:gbblogging/libraries/common/widgets/add_edit_news_modal.widget.dart';
import 'package:gbblogging/libraries/common/widgets/card.widget.dart';
import 'package:gbblogging/libraries/intl_helper/intl_helper.extension.dart';
import 'package:gbblogging/libraries/media_query/media_query_tools.dart';

class BotiCommunityView extends StatefulWidget {
  @override
  _BotiCommunityViewState createState() => _BotiCommunityViewState();
}

class _BotiCommunityViewState extends State<BotiCommunityView> {
  final HomeViewModel _viewmodel = Modular.get();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _newsController = TextEditingController();

  @override
  void initState() {
    _viewmodel.getCommunityNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryTools _mediaQuery = MediaQueryTools.of(context);
    return Observer(
      builder: (_) {
        return Container(
          height: _mediaQuery.height(530),
          child: _viewmodel.loading
              ? Center(
                  child: CircularProgressIndicator(
                      backgroundColor: primaryColor[100]))
              : _cardsListView(_mediaQuery, _viewmodel.communityNews),
        );
      },
    );
  }

  Widget _cardsListView(MediaQueryTools mediaQuery, List<NewsModel> botiNews) {
    return ListView.builder(
      itemCount: botiNews.length,
      itemBuilder: (_, index) {
        NewsModel news = botiNews[index];
        return CardWidgetBoti(
          dropdownItems: [
            DropdownMenuItem(
              value: 'edit',
              child: Text(IntlHelper.i18n(key: 'EDIT')),
            ),
            DropdownMenuItem(
              value: 'delete',
              child: Text(IntlHelper.i18n(key: 'DELETE')),
            ),
          ],
          dropdown: _viewmodel.userName == news.user.name ? true : false,
          imgUrl: news.user.profilePicture != ''
              ? news.user.profilePicture
              : BOTI_LOGO_URL,
          userName: news.user.name,
          descriptionText: news.message.content,
          date: news.message.createdAt,
          onChanged: (String value) async {
            if (value == 'edit') {
              print('edit');
              _simpleDialog(mediaQuery, news);
            } else {
              await _viewmodel.deleteNews(news);
            }
          },
        );
      },
    );
  }

  void _simpleDialog(MediaQueryTools mediaQuery, NewsModel news) {
    showDialog(
      context: context,
      builder: (_) {
        return SimpleDialog(
          contentPadding: EdgeInsets.symmetric(
              horizontal: mediaQuery.width(16),
              vertical: mediaQuery.height(16)),
          children: [
            AddEditNewsModalBoti(
              formKey: _formKey,
              newsController: _newsController,
              title: IntlHelper.i18n(key: 'EDIT_NEWS'),
              onPressed: () async {
                if (_formKey.currentState.validate()) {
                  news.message.content = _newsController.text;
                  await _viewmodel.updateNews(news);
                  _newsController.text = '';
                  Modular.to.pop();
                }
              },
            )
          ],
        );
      },
    );
  }
}
