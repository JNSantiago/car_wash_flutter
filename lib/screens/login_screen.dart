import 'package:flutter/material.dart';

import 'package:car_wash/providers/auth.dart';

import 'dart:developer';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = new GlobalKey<FormState>();
  bool _isLoading = false;

  String _email, _password;

  void _onSubmit() {
    log('data');
    final form = formKey.currentState;
    if(form.validate()) {
      setState(() => _isLoading = true );
      form.save();

      AuthProvider authProvider = new AuthProvider();
      //var res = authProvider.login(_username, _password);
      authProvider.login("eve.holt@reqres.in", "cityslicka")
        .then((res) {
          setState(() => _isLoading = false );
          Navigator.pushNamed(context, 'home');
        });
    }
  }

  @override
  Widget build(BuildContext context) {
    var loginButton = RaisedButton(
      onPressed: _onSubmit,
      child: Text("Entrar"),
      color: Colors.primaries[0],
    );

    var loginForm = Column(
      children: <Widget>[
        Form(
          key: formKey,
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(8.0),
                child: TextFormField(
                  onSaved: (val) => _email = val,
                  decoration: InputDecoration(
                    labelText: "Email",
                    labelStyle: TextStyle(color: Colors.amber),
                    border: OutlineInputBorder()
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: TextFormField(
                  onSaved: (val) => _password = val,
                  decoration: InputDecoration(
                    labelText: "Senha",
                    labelStyle: TextStyle(color: Colors.amber),
                    border: OutlineInputBorder()
                  ),
                ),
              ),
              _isLoading ? CircularProgressIndicator() : loginButton
            ],
          ),
        )
      ],
    );

    return Scaffold(
      appBar: null,
      body: Container(
        child: loginForm,
      ),
    );
  }
}