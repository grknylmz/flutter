import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return new MaterialApp(
      title: 'Foxhole artillery calculator', // Заголовок приложения
      theme: new ThemeData(
        primarySwatch: Colors.red, // Цвет темы приложения
      ),
      home: new MyHomePage(), // Домашняя страница с заголовком
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> {
  int fDistance = 0;
  int fAzimuth = 0;
  int eDistance = 0;
  int eAzimuth = 0;
  int tDistance = 0;
  int tAzimuth = 0;

  void calculate() {
    setState(() {
      // setState() - означает, что что то произошло и надо обновить отображение

    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            new Text('Друг'),
            new TextField(
              keyboardType: TextInputType.numberWithOptions(
                decimal: true,
              ),
              decoration: new InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Distance'
              ),
            ),
            new Text('Враг'),
            new TextField(
              keyboardType: TextInputType.numberWithOptions(
                decimal: true,
              ),
              decoration: new InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Distance'
              ),
            ),
            new Text('Результат'),
            new Text(
              'Distance: $tDistance, Azimuth: $tAzimuth'
            ),
          ]
      ),
    );
  }
}