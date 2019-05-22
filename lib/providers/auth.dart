import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:car_wash/models/user.dart';
import 'package:car_wash/providers/preferences.dart';

class AuthProvider {
  static AuthProvider _instance = new AuthProvider.internal();
  AuthProvider.internal();
  factory AuthProvider() => _instance;

  static final BASE_URL = "https://reqres.in/api/";
  static final LOGIN_URL = BASE_URL + "login";

  final JsonDecoder _decoder = new JsonDecoder();

  Future<dynamic> login(User user){
    return http.post(LOGIN_URL, body: { "email":  user.email, "password": user.password })
      .then((http.Response response) {
        return _decoder.convert(response.body);
      });
  }
}