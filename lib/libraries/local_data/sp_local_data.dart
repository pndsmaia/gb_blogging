import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SPLocalData extends Disposable {
  static Future<SharedPreferences> get sharedPreferences async {
    return await SharedPreferences.getInstance();
  }

  static Future<bool> validate(key) async {
    try {
      SharedPreferences prefs = await sharedPreferences;
      return prefs.containsKey(key);
    } catch (e) {
      print('ERROR:\n$e');
    }
    return null;
  }

  static Future<bool> insertOrUpdate(key, value) async {
    try {
      SharedPreferences prefs = await sharedPreferences;
      if (value is String) {
        return await prefs.setString(key, value);
      } else if (value is double) {
        return await prefs.setDouble(key, value);
      } else if (value is bool) {
        return await prefs.setBool(key, value);
      } else if (value is int) {
        return await prefs.setInt(key, value);
      } else if (value is List<String>) {
        return await prefs.setStringList(key, value);
      }
    } catch (e) {
      print('ERROR:\n$e');
    }
    return null;
  }

  static Future<bool> delete(key) async {
    try {
      SharedPreferences prefs = await sharedPreferences;
      return await prefs.remove(key);
    } catch (e) {
      print('ERROR:\n$e');
    }
    return null;
  }

  static Future<dynamic> read(key) async {
    try {
      SharedPreferences prefs = await sharedPreferences;
      return prefs.get(key);
    } catch (e) {
      print('ERROR:\n$e');
    }

    return null;
  }

  static Future<bool> clear() async {
    try {
      SharedPreferences prefs = await sharedPreferences;
      return prefs.clear();
    } catch (e) {
      print('ERROR:\n$e');
    }
    return null;
  }

  @override
  void dispose() {}
}
