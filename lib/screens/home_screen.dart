import 'package:flutter/material.dart';

import 'package:car_wash/providers/preferences.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Car Wash'),
      ),
      body: Center(
        child: Text('Welcome to the home'),
      ),
    );
  }
}