import 'package:flutter/material.dart';
import '../models/payment.dart';
import '../blocs/bloc_provider.dart';
import '../blocs/bloc_app.dart';
import '../screens/payment_add.dart';

class PaymentsList extends StatelessWidget {
  static const String routeName = "/paymentsList";
  PaymentsList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ApplicationBloc appBloc = BlocProvider.of<ApplicationBloc>(context);

    return Scaffold(
      appBar: new AppBar(
        title: new Text("Список заявок на оплату"),
        actions: <Widget>[
          IconButton(
            onPressed: appBloc.changeAccount,
            icon: Icon(Icons.account_circle),
          ),
        ],
      ),
      body: StreamBuilder<List<Payment>>(
        stream: appBloc.paymentsListSubject.stream,
        builder: (BuildContext context, AsyncSnapshot<List<Payment>> snapshot) {
          if (snapshot.hasError)
            return Card(
              color: Colors.red,
              margin: EdgeInsets.all(10.0),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 5.0),
                child: Text('Error: ${snapshot.error.toString()}', textScaleFactor: 1.25,),
              ),
            );
          else if (!snapshot.hasData)
            return Center(child: CircularProgressIndicator());
          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (context, index) {
              Payment payment = snapshot.data[index];
              return ListTiles(payment, null);
            },
          );
        },
      ),
      floatingActionButton: new FloatingActionButton(
        child: new Icon(Icons.add),
        backgroundColor: Colors.orange,
        onPressed: () { Navigator.push(context, MaterialPageRoute(builder: (context) => PaymentAdd()), ); },  //null,
      ),
    );
  }
}


// Tile
class ListTiles extends StatelessWidget {
  final Payment payment;
  final GestureTapCallback tapCallback;

  ListTiles(this.payment, this.tapCallback);

  @override
  Widget build(BuildContext context) => Card(
    color: payment.markOnRemove ? Colors.red : payment.approved ? Colors.green : Colors.yellow,
    child: Padding(
      padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 5.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
              Text('№${payment.code} от ${payment.date.day}.${payment.date.month}.${payment.date.year}',
                maxLines: 3,
                textAlign: TextAlign.center,
                textScaleFactor: 1.5,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.body1.copyWith(
                  color: Theme.of(context).textTheme.caption.color,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                child: Text(payment.accountingCodes01.name,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.subhead,
                ),
              ),
              Text('${payment.documentTotal} ${payment.documentCurrency.name.substring(0, 3)}. за ${payment.cashFlow.name}',
                maxLines: 3,
                style: Theme.of(context).textTheme.body1.copyWith(
                  color: Theme.of(context).textTheme.caption.color
                ),
              ),
              ],
            )
          ),
        ]
      )
    ),
  );
}