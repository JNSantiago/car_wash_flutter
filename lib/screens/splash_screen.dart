import 'package:car_wash/screens/home_screen.dart';
import 'package:car_wash/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:car_wash/providers/preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    PreferencesProvider prefs = new PreferencesProvider();
    prefs.isLoggedIn().then((res) => res
        ? makeRoutePage(context: context, pageRef: HomeScreen())
        : makeRoutePage(context: context, pageRef: LoginScreen())
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Splash'),
      color: Colors.black,
    );
  }

  void makeRoutePage({BuildContext context, Widget pageRef}) {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => pageRef),
        (Route<dynamic> route) => false);
  }
}
