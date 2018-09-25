import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  // у StatefulWidget надо обозначить состояние:
  State<StatefulWidget> createState() {
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> {
  // Создадим GlobalKey для доступа к состоянию формы
  final formKey = GlobalKey<FormState>();


  // У состояния обозначаем метод build
  Widget build(context) {
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Form(
        key: formKey,
        child: Column(
          children: <Widget>[
            emailField(),
            Container(margin: EdgeInsets.only(top: 10.0)),
            passwordField(),
            Container(margin: EdgeInsets.only(top: 30.0)),
            submitButton(),
          ],
        ),
      ),
    );
  }

  Widget emailField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: 'Email address',
        hintText: 'a@a.com',
      ),
    );
  }

  Widget passwordField() {
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(
          labelText: 'Password',
          hintText: 'Password',
      ),
    );
  } 

  Widget submitButton() {
    return RaisedButton(
      child: Text('Button'),
      onPressed: onPressed,
      color: Colors.redAccent,
    );
  }

  void onPressed() {
    // Сбросить состояние формы к состоянию на момент инициализации
    formKey.currentState.reset();
  }
}

// # 16 урок Validating via FormState