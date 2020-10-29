import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gbblogging/features/home/ui/home.viewmodel.dart';
import 'package:gbblogging/features/home/ui/tabs/boticommunity/boti_community.view.dart';
import 'package:gbblogging/features/home/ui/tabs/botinews/botinews.view.dart';
import 'package:gbblogging/libraries/common/colors.dart';
import 'package:gbblogging/libraries/common/widgets/add_edit_news_modal.widget.dart';
import 'package:gbblogging/libraries/intl_helper/intl_helper.extension.dart';
import 'package:gbblogging/libraries/media_query/media_query_tools.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final HomeViewModel _viewModel = Modular.get();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _newsController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final MediaQueryTools mediaQuery = MediaQueryTools.of(context);

    return Scaffold(
      body: PageView(
        children: [
          Container(
            color: primaryColor[100],
            child: CustomScrollView(
              slivers: <Widget>[
                _appBar(mediaQuery),
                _body(mediaQuery),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: primaryColor[500],
        onPressed: () {
          showDialog(
              context: context,
              builder: (_) {
                return _addNews(
                    mediaQuery: mediaQuery,
                    title: IntlHelper.i18n(key: 'ADD_NEWS'));
              });
        },
      ),
    );
  }

  Widget _appBar(MediaQueryTools mediaQuery) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      primary: true,
      floating: true,
      snap: true,
      actions: [
        IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () async {
              if (await _viewModel.signOut())
                Modular.to.pushReplacementNamed('/login');
            })
      ],
      backgroundColor: primaryColor[400],
      title: Image.asset(
          'lib/libraries/common/assets/images/boticario-logo.png',
          height: mediaQuery.height(30.0)),
      centerTitle: true,
    );
  }

  Widget _body(MediaQueryTools mediaQuery) {
    return SliverFillRemaining(
      child: DefaultTabController(
        length: 2,
        child: Column(
          children: <Widget>[
            _tabsBar(mediaQuery),
            _tabBarViews(mediaQuery),
          ],
        ),
      ),
    );
  }

  Widget _tabsBar(MediaQueryTools mediaQuery) {
    return Container(
      color: primaryColor[400],
      constraints: BoxConstraints.expand(height: mediaQuery.height(50)),
      child: TabBar(
        labelStyle: TextStyle(
          color: primaryColor[200],
          fontSize: mediaQuery.textScale * 21.0,
          fontWeight: FontWeight.w300,
        ),
        indicatorColor: primaryColor[100],
        tabs: [
          Tab(text: IntlHelper.i18n(key: 'BOTI_NEWS')),
          Tab(text: IntlHelper.i18n(key: 'BOTI_COMMUNITY')),
        ],
      ),
    );
  }

  Widget _tabBarViews(MediaQueryTools mediaQuery) {
    return Expanded(
      child: Container(
        child: TabBarView(children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: mediaQuery.width(16)),
            child: BotiNewsView(),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: mediaQuery.width(16)),
            child: BotiCommunityView(),
          ),
        ]),
      ),
    );
  }

  Widget _addNews(
      {@required MediaQueryTools mediaQuery, @required String title}) {
    return SimpleDialog(
      contentPadding: EdgeInsets.symmetric(
          horizontal: mediaQuery.width(16), vertical: mediaQuery.height(16)),
      children: [
        AddEditNewsModalBoti(
          formKey: _formKey,
          newsController: _newsController,
          title: IntlHelper.i18n(key: 'ADD_NEWS'),
          onPressed: () async {
            if (_formKey.currentState.validate()) {
              await _viewModel.addNews(_newsController.text);
              _newsController.text = '';
              Modular.to.pop();
            }
          },
        )
      ],
    );
  }
}
