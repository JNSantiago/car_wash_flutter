import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import 'package:car_wash/models/user.dart';

class PreferencesProvider {
  static PreferencesProvider _instance = new PreferencesProvider.internal();
  PreferencesProvider.internal();
  factory PreferencesProvider() => _instance;

  final JsonDecoder _decoder = new JsonDecoder();

  Future getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("user");
  }

  Future create(User user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString("user", json.encode(user.toString()));
  }
}