import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class SpUtil {
  SpUtil._internal();

  static late final SpUtil _instance = SpUtil._internal();

  factory SpUtil() => _instance;

  SharedPreferences? _spf;

  Future<void> init() async {
    _spf = await SharedPreferences.getInstance();
  }

  /// base type
  Future<bool> setJSON(String key, dynamic jsonVal) {
    String jsonString = jsonEncode(jsonVal);
    return _spf!.setString(key, jsonString);
  }

  dynamic getJSON(String key) {
    String? jsonString = _spf?.getString(key);
    return jsonString == null ? null : jsonDecode(jsonString);
  }

  Future<bool> setBool(String key, bool val) {
    return _spf!.setBool(key, val);
  }

  bool getBool(String key) {
    return _spf!.getBool(key) ?? false;
  }

  Future<bool> setString(String key, String val) {
    return _spf!.setString(key, val);
  }

  String? getString(String key) {
    return _spf!.getString(key);
  }

  Future<bool> remove(String key) {
    return _spf!.remove(key);
  }
}
