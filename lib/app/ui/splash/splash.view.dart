import 'package:flutter/material.dart';
import 'package:gbblogging/libraries/common/colors.dart';
import 'package:gbblogging/libraries/intl_helper/intl_helper.extension.dart';
import 'package:gbblogging/libraries/media_query/media_query_tools.dart';

class SplashView extends StatefulWidget {
  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  Widget build(BuildContext context) {
    MediaQueryTools _mediaQuery = MediaQueryTools.of(context);

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: _mediaQuery.height(640),
        color: primaryColor[400],
        child: Stack(
          children: [
            Center(child: _logoImage(_mediaQuery)),
            _textPositioned(_mediaQuery),
          ],
        ),
      ),
    );
  }

  Widget _logoImage(MediaQueryTools mediaQuery) {
    return Image.asset(
      'lib/libraries/common/assets/images/boti-blogging-logo.png',
      width: mediaQuery.width(200),
    );
  }

  Widget _textPositioned(MediaQueryTools mediaQuery) {
    return Positioned(
      bottom: mediaQuery.height(20),
      left: 0,
      right: 0,
      child: Column(
        children: [
          _informationText(
            mediaQuery,
            text: 'by: ${IntlHelper.i18n(key: 'DEV_NAME')}',
          ),
          _informationText(
            mediaQuery,
            text: IntlHelper.i18n(key: 'DEV_EMAIL'),
          ),
        ],
      ),
    );
  }

  Widget _informationText(MediaQueryTools mediaQuery, {@required String text}) {
    return Text(
      text,
      style: TextStyle(color: primaryColor[200]),
    );
  }
}
