import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // Это корневой виджет
  @override
  Widget build(BuildContext context) {
    var now = new DateTime.now();
    var month = (now.month < 10)? '0' + now.month.toString(): now.month.toString();
    final String title = 'Курс ЦБ на ${now.day}.$month.${now.year}'; // Переменная заголовка
    return new MaterialApp(
      title: title, // Заголовок приложения
      theme: new ThemeData(
        primarySwatch: Colors.red, // Цвет темы приложения
      ),
      home: new MyHomePage(title: title), // Домашняя страница с заголовком
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // Это виджет домашней страницы, определяющий как оно будет выглядеть
  // Поля в подклассе Widget всегда обозначаются как «final».

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // setState() - означает, что что то произошло и надо обновить отображение
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Этот метод вызывается каждый раз когда вызывается setState
    // для метода _incrementCounter выше.
    return new Scaffold(
      appBar: new AppBar(
        // Здесь мы получаем значение из объекта MyHomePage который был создан
        // методом App.build, и используется, чтоб установить заголовок.
        title: new Text(widget.title),
      ),
      body: new Center(
        // Центрируем слой относительно родительского.
        // Для этого устанавливаем в child центрируемый объект.
        child: new Column(
          // Column (столбец) также виджет слоя. Он принимает список подчиненных
          // и распределяет их вертикально. По умолчанию старается вписать в себя
          // подчиненные горизонтально и пытается разместиться по длине
          // родительского.
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            new Row(
              children: <Widget>[
                new Text(
                  'Вы ткнули кнопку следующее количество раз:',
                ),
                new Text(
                  '$_counter',
                  style: Theme.of(context).textTheme.display1,
                ),
              ],
            ),
            new Row(
              children: <Widget>[
                new Text(
                  'И еще разок:',
                ),
                new Text(
                  '$_counter',
                  style: Theme.of(context).textTheme.display1,
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: new Icon(Icons.add),
        backgroundColor: Colors.green,
        mini: true,
      ),
    );
  }
}
