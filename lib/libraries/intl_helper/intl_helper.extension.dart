import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

extension IntlHelper on String {
  static Map<String, String> translates;
  static String selectedLang;

  static Future<bool> configuration({
    String assetsPath = "assets/lang",
    String defaultLang = "pt_BR",
    String selectedLanguage,
  }) async {
    selectedLang = selectedLanguage ?? Platform.localeName;
    String data;
    debugPrint(selectedLanguage ?? Platform.localeName);
    debugPrint("CARREGANDO ARQUIVOS DE TRADUÇÃO...");
    try {
      data = await rootBundle.loadString(
          '$assetsPath/${selectedLanguage ?? Platform.localeName}.json');
    } catch (_) {
      data = await rootBundle.loadString('$assetsPath/$defaultLang.json');
    }
    Map<String, dynamic> _result = json.decode(data);

    translates = Map();
    _result.forEach((String key, dynamic value) {
      translates[key] = value.toString();
    });
    debugPrint("OS ARQUIVOS DE TRADUÇÃO FORAM CARREGADOS!");
    return true;
  }

  static String i18n({@required String key, List<String> args}) {
    if (translates == null) {
      throw "Setences = null";
    }
    String res = translates[key];
    if (res == null) {
      res = key;
    } else {
      if (args != null) {
        args.forEach((arg) {
          res = res.replaceFirst(RegExp(r'%s'), arg.toString());
        });
      }
    }
    return res;
  }

  static String get getSelectedLanguage => selectedLang;

  static void fromJson(Map<String, dynamic> json) => translates = json;

  Map<String, String> toJson() => translates;
}
