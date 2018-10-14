import 'package:flutter/material.dart';
import 'payment_add.dart';
import '../blocs/bloc_provider.dart';

class PaymentsList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final ApplicationBloc appBloc = BlocProvider.of<ApplicationBloc>(context);

    return Scaffold(
      appBar: new AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: new Text("Список заявок на оплату"),
      ),
      floatingActionButton: new FloatingActionButton(
          child: new Icon(Icons.add),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PaymentAdd()),
            );
          },
      ),
      body: Column(
        children: <Widget>[
          Text('ADD'),

        ],
      ),
    );
  }
}