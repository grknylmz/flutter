import 'package:flutter/material.dart';
import '../blocs/bloc_provider.dart';
import '../blocs/bloc_app.dart';
import '../models/dictionary.dart';
import '../models/constant.dart';
import '../widgets/widgets.dart';

class PaymentAdd extends StatelessWidget {
  PaymentAdd({Key key}) : super(key: key);
  static const String routeName = "/paymentAdd";

  @override
  Widget build(BuildContext context) {
    final ApplicationBloc appBloc = BlocProvider.of<ApplicationBloc>(context);

    return Scaffold(
      appBar: new AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: new Text("Создать заявку на оплату"),
      ),
      body: ListView(
        children: <Widget>[

          // Организация
          StreamBuilder(
            stream: appBloc.currentOrganizationSubject.stream,
            builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
              return DropdownButton(
                hint: Text('Организация'),
                value: snapshot.data,
                onChanged: (String newValue) {
                  if (newValue != null && newValue.isNotEmpty)
                    appBloc.currentOrganizationSubject.add(newValue);
                },
                items: appBloc.organizationListSubject.value.map<DropdownMenuItem<String>>((Organization value) {
                  return DropdownMenuItem<String>(
                    value: value.code,
                    child: Text(value.name),
                  );
                }).toList(),
              );
            },
          ),

          SizedBox(height: 10.0,),

          // Контрагент
          StreamBuilder(
            stream: appBloc.currentCounterpartySubject.stream,
            builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
              return FixedDropDownButton(
                hint: Text('Контрагент'),
                value: snapshot.data,
                onChanged: (String newValue) {
                  if (newValue != null && newValue.isNotEmpty)
                    appBloc.currentCounterpartySubject.add(newValue);
                },
                items: appBloc.counterpartyListSubject.value.map<FixDropdownMenuItem<String>>((Counterparty value) {
                  return FixDropdownMenuItem<String>(
                    value: value.code,
                    child: Text(value.name),
                  );
                }).toList(),
              );
            },
          ),

          SizedBox(height: 10.0,),

          // Центр ответсвенности
          StreamBuilder(
            stream: appBloc.currentResponsibilityCenterSubject.stream,
            builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
              return FixedDropDownButton(
                hint: Text('Центр ответсвенности'),
                value: snapshot.data,
                onChanged: (String newValue) {
                  if (newValue != null && newValue.isNotEmpty)
                    appBloc.currentResponsibilityCenterSubject.add(newValue);
                },
                items: appBloc.responsibilityCenterListSubject.value.map<FixDropdownMenuItem<String>>((ResponsibilityCenter value) {
                  return FixDropdownMenuItem<String>(
                    value: value.code,
                    child: Text(value.name),
                  );
                }).toList(),
              );
            },
          ),

          SizedBox(height: 10.0,),

          // Средство оплаты
          StreamBuilder(
            stream: appBloc.currentBankAccountSubject.stream,
            builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
              return FixedDropDownButton(
                hint: Text('Средство оплаты'),
                value: snapshot.data,
                onChanged: (String newValue) {
                  if (newValue != null && newValue.isNotEmpty)
                    appBloc.currentBankAccountSubject.add(newValue);
                },
                items: appBloc.bankAccountListSubject.value.map<FixDropdownMenuItem<String>>((BankAccount value) {
                  return FixDropdownMenuItem<String>(
                    value: value.code,
                    child: Text(value.name),
                  );
                }).toList(),
              );
            },
          ),

          SizedBox(height: 10.0,),

          // Статья ДДС
          StreamBuilder(
            stream: appBloc.currentCashFlowSubject.stream,
            builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
              return FixedDropDownButton(
                hint: Text('Статья ДДС'),
                value: snapshot.data,
                onChanged: (String newValue) {
                  if (newValue != null && newValue.isNotEmpty)
                    appBloc.currentCashFlowSubject.add(newValue);
                },
                items: appBloc.cashFlowListSubject.value.map<FixDropdownMenuItem<String>>((CashFlow value) {
                  return FixDropdownMenuItem<String>(
                    value: value.code,
                    child: Text(value.name),
                  );
                }).toList(),
              );
            },
          ),

          SizedBox(height: 10.0,),

          // Ставка НДС
          StreamBuilder(
            stream: appBloc.currentTaxSubject.stream,
            builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
              return FixedDropDownButton(
                hint: Text('Ставка НДС'),
                value: snapshot.data,
                onChanged: (String newValue) {
                  if (newValue != null && newValue.isNotEmpty)
                    appBloc.currentTaxSubject.add(newValue);
                },
                items: appBloc.taxListSubject.value .map<FixDropdownMenuItem<String>>((Tax value) {
                  return FixDropdownMenuItem<String>(
                    value: value.code,
                    child: Text(value.name),
                  );
                }).toList(),
              );
            },
          ),

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

          Padding(
            padding: EdgeInsets.all(25.0),
            child: RaisedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) => SimpleDialog(
                    title: Text('Эмуляция создания заявки'),
                    children: <Widget>[
                      ListTile(
                        leading: Text('+'),
                        title: Text('Организация: ${appBloc.currentOrganizationSubject.value}'),
                      ),
                      ListTile(
                        leading: Text('+'),
                        title: Text('Контрагент: ${appBloc.currentCounterpartySubject.value}'),
                      ),
                    ],
                  ),
                );
                Navigator.pop(context);
              },
              child: Text('С О З Д А Т Ь   З А Я В К У', textScaleFactor: 1.2,),
            ),
          ),

        ],
      ),
    );
  }
}
