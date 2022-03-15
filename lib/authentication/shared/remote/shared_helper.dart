
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedHelper {
  static SharedPreferences? sharedPreferences;
  static initshared() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static dynamic getdata({required String key}) {
    return sharedPreferences!.get(key);
  }

  static Future<bool> savedata({
    String? key,
    dynamic value,
  }) async {
    if (value is String) {
      return await sharedPreferences!.setString(key!, value); 
    }
    if (value is int) {
      return await sharedPreferences!.setInt(key!, value);
    }
    if (value is bool) {
      return await sharedPreferences!.setBool(key!, value);
    }
    if (value is double) {
      return await sharedPreferences!.setDouble(key!, value);
    } else {
      throw('Err saving data at shared_helper.dart');
    }
  }
}
