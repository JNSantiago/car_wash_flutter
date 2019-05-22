import 'package:flutter/material.dart';
import 'package:car_wash/screens/login_screen.dart';
import 'package:car_wash/screens/home_screen.dart';

final routes = {
  '/': (BuildContext context) => new LoginScreen(),
  'login': (BuildContext context) => new LoginScreen(),
  'home': (BuildContext context) => new HomeScreen(),
};