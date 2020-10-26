import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:gbblogging/features/home/ui/tabs/botinews/botinews.view.dart';
import 'package:gbblogging/libraries/common/colors.dart';
import 'package:gbblogging/libraries/intl_helper/intl_helper.extension.dart';
import 'package:gbblogging/libraries/media_query/media_query_tools.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
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
    );
  }

  Widget _appBar(MediaQueryTools mediaQuery) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      primary: true,
      floating: true,
      snap: true,
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
            child: Container(
              color: Colors.red,
            ),
          ),
        ]),
      ),
    );
  }
}
