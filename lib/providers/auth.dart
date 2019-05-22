import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthProvider {
  static AuthProvider _instance = new AuthProvider.internal();
  AuthProvider.internal();
  factory AuthProvider() => _instance;

  static final BASE_URL = "https://reqres.in/api/";
  static final LOGIN_URL = BASE_URL + "login";

  final JsonDecoder _decoder = new JsonDecoder();

  Future<dynamic> login(String email, String password){
    return http.post(LOGIN_URL, body: { "email":  email, "password": password})
      .then((http.Response response) {
        final String res = response.body;
        final int statusCode = response.statusCode;

        if (statusCode < 200 || statusCode > 400 || json == null) {
          throw new Exception("Error while fetching data");
        }

        return _decoder.convert(res);
      });
  }
}