import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static SharedPreferences sharedPreferences;
  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> setDate(
      {@required String key, @required String value}) async {
    return await sharedPreferences.setString(key, value);
  }

  static dynamic getDate({@required String key}) {
    return sharedPreferences.get(key);
  }

  static dynamic deleteDate({@required String key}) async {
    return await sharedPreferences.remove(key);
  }
}
