import 'dart:async';
import 'package:rxdart/rxdart.dart';
import '../models/payment.dart';
import '../models/constant.dart';  // Константы
import '../models/dictionary.dart';  // Константы
import 'package:http/http.dart' as http;
import '../models/user.dart';
import 'dart:convert';

class BlocPayment {

  // CONSTANTS +

  // CONSTANTS -

  // VARS +
  //String _token;
  // VARS -

  // STREAMS +
  final _paymentsListController = StreamController<List<Payment>>();
  Stream<List<Payment>> get paymentsList => _paymentsListController.stream;
  // STREAMS -

  // CONSTRUCTOR
  BlocPayment();

  // Получить заявки на оплату
  void getPayments(User user) async {
    //String _token = "ya29.Gls0BtSUh7gHwy_xpw3Pq4usEE8fW4SXWjVx_DJd1Rn2QCxLRdAWpdJDeibCaRdvQYIMnPPl_bA_umD21eRIr3PmYKMnxJlifD6TLPif-R9BZ07uuE_Cax1mFhRC";
    String _token = user.token;

    if (_token == null || _token.isEmpty) return;

    http.Response response = await http.get("$itanBaseUrl$itanPaymentsUrl?token=$_token&fields=all");
    String body = utf8.decode(response.bodyBytes);
    if (response.statusCode != 200) {
      if (response.headers['content-type'] == 'application/json')
        _paymentsListController.addError(jsonDecode(body)['errorText']);
      else if (body.isNotEmpty)
        _paymentsListController.addError(body);
      else
        _paymentsListController.addError('Произошла непредвиденная ошибка при получении списка заявок на оплату.');
      return;
      //throw body;
    }
    List<Object> listFromJson = jsonDecode(body)['data']['payments'] as List;
    List<Payment> paymentsListFromJson = listFromJson.map((i) => new Payment.fromJSON(i)).toList();
    _paymentsListController.add(paymentsListFromJson);
  }

  // Close streams
  void dispose(){
    _paymentsListController.close();
  }
}

class BlocCurrentPayment {
  // CONSTANTS +

  // CONSTANTS -

  // VARS +

  // VARS -

  // STREAMS +
  BehaviorSubject<String> organizationSC = BehaviorSubject<String>();
  BehaviorSubject<String> counterpartySC = BehaviorSubject<String>();
  BehaviorSubject<String> responsibilityCenterSC = BehaviorSubject<String>();
  BehaviorSubject<String> bankAccountSC = BehaviorSubject<String>();
  BehaviorSubject<String> cashFlowSC = BehaviorSubject<String>();
  BehaviorSubject<String> taxSC = BehaviorSubject<String>();
  // STREAMS -

  // CONSTRUCTOR
  BlocCurrentPayment();

  // Close streams
  void dispose(){
    organizationSC.close();
    counterpartySC.close();
    responsibilityCenterSC.close();
    bankAccountSC.close();
    cashFlowSC.close();
    taxSC.close();
  }
}