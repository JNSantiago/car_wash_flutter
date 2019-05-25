import 'package:flutter/material.dart';
import 'package:car_wash/routes.dart';

void main() => runApp(CarWash());

class CarWash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
        title: 'Car Wash',
        initialRoute: '/',
        theme: ThemeData(primarySwatch: Colors.blue),
        routes: routes
    );
  }
}
