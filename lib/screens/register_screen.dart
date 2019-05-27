import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final formKey = new GlobalKey<FormState>();
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  bool _isLoading = false;

  String _email, _password, _name;

  @override
  Widget build(BuildContext context) {
    var registerButton = RaisedButton(
      onPressed: () => {},
      child: Text("Entrar"),
      color: Colors.primaries[0],
    );

    var registerForm = Column(
      children: <Widget>[
        Form(
          key: formKey,
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(8.0),
                child: TextFormField(
                  onSaved: (val) => _name = val,
                  decoration: InputDecoration(
                      labelText: "Nome",
                      labelStyle: TextStyle(color: Colors.amber),
                      border: OutlineInputBorder()),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: TextFormField(
                  onSaved: (val) => _email = val,
                  decoration: InputDecoration(
                      labelText: "Email",
                      labelStyle: TextStyle(color: Colors.amber),
                      border: OutlineInputBorder()),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: TextFormField(
                  onSaved: (val) => _password = val,
                  decoration: InputDecoration(
                      labelText: "Senha",
                      labelStyle: TextStyle(color: Colors.amber),
                      border: OutlineInputBorder()),
                ),
              ),
               _isLoading ? CircularProgressIndicator() : registerButton
            ],
          ),
        )
      ],
    );

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text('Cadastre-se'),
      ),
      body: Container(
        child: registerForm,
      ),
    );
  }
}
