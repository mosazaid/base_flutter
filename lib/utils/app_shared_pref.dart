import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';


class AppSharedPreferences {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  setString(String key, String value) async {
    final SharedPreferences prefs = await _prefs;
    return prefs.setString(key, value);
  }

  setStringList(String key, List<String> value) async {
    final SharedPreferences prefs = await _prefs;

    return prefs.setStringList(key, value);
  }

  setDouble(String key, double value) async {
    final SharedPreferences prefs = await _prefs;

    return prefs.setDouble(key, value);
  }

  setBool(String key, bool value) async {
    final SharedPreferences prefs = await _prefs;
    return prefs.setBool(key, value);
  }

  setInt(String key, int value) async {
    final SharedPreferences prefs = await _prefs;
    return prefs.setInt(key, value);
  }

  getString(String key) async {
    final SharedPreferences prefs = await _prefs;
    return prefs.getString(key);
  }

  /// Get String [key] the key was saved
  getStringWithDefaultValue(String key, String defaultVal) async {
    final SharedPreferences prefs = await _prefs;
    String value = prefs.getString(key);
    return value == null ? defaultVal : value;
  }

  setObj(String key, value) async {
    final SharedPreferences prefs = await _prefs;

    return prefs.setString(key, json.encode(value));
  }

  getPref() async {
    Future<SharedPreferences> _prefs = getInstance();
    return await _prefs;
  }

  getInstance() {
    return SharedPreferences.getInstance();
  }

  getStringList(String key) async {
    final SharedPreferences prefs = await _prefs;

    return prefs.getStringList(key);
  }

  getDouble(String key) async {
    final SharedPreferences prefs = await _prefs;

    return prefs.getDouble(key);
  }

  getBool(String key) async {
    final SharedPreferences prefs = await _prefs;
    return prefs.getBool(key);
  }

  getInt(String key) async {
    final SharedPreferences prefs = await _prefs;
    return prefs.getInt(key);
  }

  getObj(String key) async{
    final SharedPreferences prefs = await _prefs;
    var string = prefs.getString(key);
    if (string == null ){
      return null;
    }
    return json.decode(string);
  }

  clear() async {
    final SharedPreferences prefs = await _prefs;
   var vvas= await prefs.clear();
   var asd;
  }

  remove(String key) async {
    final SharedPreferences prefs = await _prefs;
    prefs.remove(key);
  }
}
