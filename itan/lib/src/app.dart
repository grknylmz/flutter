import 'package:flutter/material.dart';
import 'screens/login.dart';
import 'screens/payments_list.dart';
import 'screens/payment_add.dart';
import 'blocs/bloc_provider.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => new _AppState();
}

class _AppState extends State<App> {
  @override
  initState() {
    super.initState();
    SimpleAuthFlutter.init(context);
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'ИТАН',
      theme: new ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: new PaymentsList(),
      routes: <String, WidgetBuilder> {
        '/login': (BuildContext context) => new Login(), // title: 'Auth Home Page'
        '/list' : (BuildContext context) => new PaymentsList(),
        '/add': (BuildContext context) => new PaymentAdd(),
      },
    );
  }
}