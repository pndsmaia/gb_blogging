import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gbblogging/libraries/firebase/firebase.auth.dart';
import 'package:gbblogging/libraries/intl_helper/intl_helper.extension.dart';

class AppWidget extends StatelessWidget {
  AppWidget() {
    IntlHelper.configuration(
      assetsPath: 'lib/libraries/common/assets/lang',
      selectedLanguage: Platform.localeName,
    );

    FbAuth.fbAuthInstance.authStateChanges().listen((User userFb) async {
      if (userFb == null) {
        print('USER IS CURRENTLY SIGNED OUT!');
      } else {
        print('USER IS SIGNED IN!');
      }
    });
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
