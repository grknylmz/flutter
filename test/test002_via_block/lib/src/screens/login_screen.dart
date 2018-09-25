import 'package:flutter/material.dart';
import '../mixins/validation_mixin.dart';

// Экран
class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginScreenState();
  }
}

// Состояние экрана
class LoginScreenState extends State<LoginScreen> with ValidationMixin {
  // Ассоциируем переменную с состоянием формы
  final formKey = GlobalKey<FormState>();

  String email;
  String password;

  Widget build(context) {
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Form(
        key: formKey,
        child: Column(
          children: <Widget>[
            emailField(),
            passwordField(),
            space(EdgeInsets.only(bottom: 25.0)),
            submitButton(),
          ],
        ),
      ),
    );
  }

  // Поле мыла
  Widget emailField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: 'Адрес электронной почты',
        hintText: 'email@redmadrobot.com'
      ),
      validator: validateEmail,
      onSaved: (value) { email = value; },
    );
  }

  // Поле пароля
  Widget passwordField() {
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(
          labelText: 'Введите пароль',
          hintText: 'Пароль'
      ),
      validator: validatePassword,
      onSaved: (value) { password = value; },
    );
  }

  // Отступ
  Widget space(EdgeInsets edgeInsets) {
    return Container(
      margin: edgeInsets,
    );
  }

  // Кнопка отправить
  Widget submitButton() {
    return RaisedButton(
      color: Colors.deepOrange,
      padding: EdgeInsets.all(5.0),
      child: Text('Отправить'),
      onPressed: submitClick,
    );
  }

  // Действие кнопки отправить
  void submitClick() {
    // // Очистить форму
    // formKey.currentState.reset();

    // Проверить форму
    if (!formKey.currentState.validate()) return;
    formKey.currentState.save();
    print('Отправляем email: $email и пароль: $password на API');
  }

}

// vid\flutter-stephen-grider\14. Advanced Flutter Architecture - The Bloc Pattern