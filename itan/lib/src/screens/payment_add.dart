import 'package:flutter/material.dart';
import '../blocs/bloc_provider.dart';

class PaymentAdd extends StatelessWidget {
  PaymentAdd({Key key}) : super(key: key);
  static const String routeName = "/paymentAdd";

  @override
  void dispose() {

  }

  @override
  Widget build(BuildContext context) {
    //final BlocCurrentPayment blocCurrentPayment = BlocProvider.of<ApplicationBloc>(context).blocCurrentPayment;
    //final BlocDictionary blocDictionary = BlocProvider.of<ApplicationBloc>(context).blocDictionary;

    return Scaffold(
      appBar: new AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: new Text("Создать заявку на оплату"),
      ),
      body: ListView(
        children: <Widget>[

//          // Организация
//          StreamBuilder(
//            stream: blocCurrentPayment.organizationSC.stream,
//            builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
//              return DropdownButton(
//                hint: Text('Организация'),
//                value: snapshot.data,
//                onChanged: (String newValue) {
//                  if (newValue != null && newValue.isNotEmpty)
//                    blocCurrentPayment.organizationSC.add(newValue);
//                },
//                items: blocDictionary.organizationList.map<DropdownMenuItem<String>>((Organization value) {
//                  return DropdownMenuItem<String>(
//                    value: value.code,
//                    child: Text(value.name),
//                  );
//                }).toList(),
//              );
//            },
//          ),

          SizedBox(height: 10.0,),

//          // Контрагент
//          StreamBuilder(
//            stream: blocCurrentPayment.counterpartySC.stream,
//            builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
//              return FixedDropDownButton(
//                hint: Text('Контрагент'),
//                value: snapshot.data,
//                onChanged: (String newValue) {
//                  if (newValue != null && newValue.isNotEmpty)
//                    blocCurrentPayment.counterpartySC.add(newValue);
//                },
//                items: blocDictionary.counterpartyList.map<FixDropdownMenuItem<String>>((Counterparty value) {
//                  return FixDropdownMenuItem<String>(
//                    value: value.code,
//                    child: Text(value.name),
//                  );
//                }).toList(),
//              );
//            },
//          ),

          SizedBox(height: 10.0,),

//          // Центр ответсвенности
//          StreamBuilder(
//            stream: blocCurrentPayment.responsibilityCenterSC.stream,
//            builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
//              return FixedDropDownButton(
//                hint: Text('Центр ответсвенности'),
//                value: snapshot.data,
//                onChanged: (String newValue) {
//                  if (newValue != null && newValue.isNotEmpty)
//                    blocCurrentPayment.responsibilityCenterSC.add(newValue);
//                },
//                items: blocDictionary.responsibilityCenterList.map<FixDropdownMenuItem<String>>((ResponsibilityCenter value) {
//                  return FixDropdownMenuItem<String>(
//                    value: value.code,
//                    child: Text(value.name),
//                  );
//                }).toList(),
//              );
//            },
//          ),

          SizedBox(height: 10.0,),

//          // Средство оплаты
//          StreamBuilder(
//            stream: blocCurrentPayment.bankAccountSC.stream,
//            builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
//              return FixedDropDownButton(
//                hint: Text('Средство оплаты'),
//                value: snapshot.data,
//                onChanged: (String newValue) {
//                  if (newValue != null && newValue.isNotEmpty)
//                    blocCurrentPayment.bankAccountSC.add(newValue);
//                },
//                items: blocDictionary.bankAccountList.map<FixDropdownMenuItem<String>>((BankAccount value) {
//                  return FixDropdownMenuItem<String>(
//                    value: value.code,
//                    child: Text(value.name),
//                  );
//                }).toList(),
//              );
//            },
//          ),

          SizedBox(height: 10.0,),

//          // Статья ДДС
//          StreamBuilder(
//            stream: blocCurrentPayment.cashFlowSC.stream,
//            builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
//              return FixedDropDownButton(
//                hint: Text('Статья ДДС'),
//                value: snapshot.data,
//                onChanged: (String newValue) {
//                  if (newValue != null && newValue.isNotEmpty)
//                    blocCurrentPayment.cashFlowSC.add(newValue);
//                },
//                items: blocDictionary.cashFlowList.map<FixDropdownMenuItem<String>>((CashFlow value) {
//                  return FixDropdownMenuItem<String>(
//                    value: value.code,
//                    child: Text(value.name),
//                  );
//                }).toList(),
//              );
//            },
//          ),

          SizedBox(height: 10.0,),

//          // Ставка НДС
//          StreamBuilder(
//            stream: blocCurrentPayment.taxSC.stream,
//            builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
//              return FixedDropDownButton(
//                hint: Text('Ставка НДС'),
//                value: snapshot.data,
//                onChanged: (String newValue) {
//                  if (newValue != null && newValue.isNotEmpty)
//                    blocCurrentPayment.taxSC.add(newValue);
//                },
//                items: blocDictionary.taxList.map<FixDropdownMenuItem<String>>((Tax value) {
//                  return FixDropdownMenuItem<String>(
//                    value: value.code,
//                    child: Text(value.name),
//                  );
//                }).toList(),
//              );
//            },
//          ),

          SizedBox(height: 10.0,),

          // Сумма платежа
          TextFormField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: 'Сумма платежа',
              errorText: null,
              suffixText: 'Руб.',
              suffixStyle: TextStyle(color: Colors.red),
            ),
          ),

          SizedBox(height: 10.0,),

//          Padding(
//            padding: EdgeInsets.all(25.0),
//            child: RaisedButton(
//              onPressed: () {
//                print('Эмуляция создания заявки для организации: ${blocCurrentPayment.organizationSC.stream.value}');
//                Navigator.pop(context);
//              },
//              child: Text('С О З Д А Т Ь   З А Я В К У', textScaleFactor: 1.2,),
//            ),
//          ),

        ],
      ),
    );
  }
}
