import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gbblogging/libraries/intl_helper/intl_helper.extension.dart';

class AppWidget extends StatelessWidget {
  AppWidget() {
    IntlHelper.configuration(
      assetsPath: 'lib/libraries/common/assets/lang',
      selectedLanguage: Platform.localeName,
    );
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: Modular.navigatorKey,
      title: 'GB Blogging',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      onGenerateRoute: Modular.generateRoute,
    );
  }
}
