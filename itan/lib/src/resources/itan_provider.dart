import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/payment.dart';
import '../models/dictionary.dart';
import '../models/constant.dart';
import '../models/user.dart';

class ITANProvider {
  // Возвращает пользователя из ИТАН'а
  Future<User> getUserFromMap(Map<String, dynamic> map) async {
    http.Response response = await http.get("$itanBaseUrl$itanUserUrl?token=${map['token']}");
    String body = utf8.decode(response.bodyBytes);
    if (response.statusCode != 200) return null;
    var userFromJson = jsonDecode(body)['data'];
    map['code'] = userFromJson['code'];
    map['name'] = userFromJson['name'];
    map['creationDate'] = new DateTime.now().millisecondsSinceEpoch;
    User user = new User.fromDB(map);
    return user;
  }

  // Возвращает пользователя из ИТАН'а
  Future<User> updateUser(User user) async {
    http.Response response = await http.get("$itanBaseUrl$itanUserUrl?token=${user.token}");
    String body = utf8.decode(response.bodyBytes);
    if (response.statusCode != 200) return null;
    var userFromJson = jsonDecode(body)['data'];
    user.code = userFromJson['code'];
    user.name = userFromJson['name'];
    return user;
  }

  logout(User user) async {
    http.get("$itanBaseUrl$itanLogoutUrl?token=${user.token}");
  }

  // Получить заявки на оплату
  Future<List<Payment>> getPayments(User user) async {
    String _token = user.token;
    if (_token == null || _token.isEmpty) return null;

    http.Response response = await http.get("$itanBaseUrl$itanPaymentsUrl?token=$_token&fields=all");
    String body = utf8.decode(response.bodyBytes);
    if (response.statusCode != 200) return null;
//      if (response.headers['content-type'] == 'application/json')
//        _paymentsListController.addError(jsonDecode(body)['errorText']);
//      else if (body.isNotEmpty)
//        _paymentsListController.addError(body);
//      else
//        _paymentsListController.addError('Произошла непредвиденная ошибка при получении списка заявок на оплату.');
    List<Object> listFromJson = jsonDecode(body)['data']['payments'] as List;
    List<Payment> paymentsListFromJson = listFromJson.map((i) => new Payment.fromJSON(i)).toList();
    return paymentsListFromJson;
  }

  // Получить справочники

  Future<List<Organization>> getOrganizationList(User user) async {
    String _token = user.token;
    if (_token == null || _token.isEmpty) return null;
    http.Response response = await http.get("$itanBaseUrl$itanDictionaryUrl?token=$_token&dictionary=organization&count=5000");
    String body = utf8.decode(response.bodyBytes);
    if (response.statusCode != 200) return null;
    List<Object> listFromJson = jsonDecode(body)['data'] as List;
    List<Organization> organizationList = listFromJson.map((i) => new Organization.fromJSON(i)).toList();
    return organizationList;
  }

  Future<List<ResponsibilityCenter>> getResponsibilityCenterList(User user) async {
    String _token = user.token;
    if (_token == null || _token.isEmpty) return null;
    http.Response response = await http.get("$itanBaseUrl$itanDictionaryUrl?token=$_token&dictionary=ResponsibilityCenter&count=5000");
    String body = utf8.decode(response.bodyBytes);
    if (response.statusCode != 200) return null;
    List<Object> listFromJson = jsonDecode(body)['data'] as List;
    List<ResponsibilityCenter> responsibilityCenterList = listFromJson.map((i) => new ResponsibilityCenter.fromJSON(i)).toList();
    return responsibilityCenterList;
  }

  Future<List<BankAccount>> getBankAccountList(User user) async {
    String _token = user.token;
    if (_token == null || _token.isEmpty) return null;
    http.Response response = await http.get("$itanBaseUrl$itanDictionaryUrl?token=$_token&dictionary=BankAccount&count=5000");
    String body = utf8.decode(response.bodyBytes);
    if (response.statusCode != 200) return null;
    List<Object> listFromJson = jsonDecode(body)['data'] as List;
    List<BankAccount> bankAccountList = listFromJson.map((i) => new BankAccount.fromJSON(i)).toList();
    return bankAccountList;
  }

  Future<List<Counterparty>> getCounterpartyList(User user) async {
    String _token = user.token;
    if (_token == null || _token.isEmpty) return null;
    http.Response response = await http.get("$itanBaseUrl$itanDictionaryUrl?token=$_token&dictionary=Counterparty&count=5000");
    String body = utf8.decode(response.bodyBytes);
    if (response.statusCode != 200) return null;
    List<Object> listFromJson = jsonDecode(body)['data'] as List;
    List<Counterparty> counterpartyList = listFromJson.map((i) => new Counterparty.fromJSON(i)).toList();
    return counterpartyList;
  }

  Future<List<CashFlow>> getCashFlowList(User user) async {
    String _token = user.token;
    if (_token == null || _token.isEmpty) return null;
    http.Response response = await http.get("$itanBaseUrl$itanDictionaryUrl?token=$_token&dictionary=CashFlow&count=5000");
    String body = utf8.decode(response.bodyBytes);
    if (response.statusCode != 200) return null;
    List<Object> listFromJson = jsonDecode(body)['data'] as List;
    List<CashFlow> cashFlowList = listFromJson.map((i) => new CashFlow.fromJSON(i)).toList();
    return cashFlowList;
  }

  Future<List<Tax>> getTaxList(User user) async {
    String body = r'{"data":'
        r'[{"index":0,"code":"НДС18","name":"18%"},'
        r'{"index":4,"code":"НДС0","name":"0%"},'
        r'{"index":5,"code":"БезНДС","name":"Без НДС"},'
        r'{"index":6,"code":"НДС20","name":"20%"}]}';
    List<Object> listFromJson = jsonDecode(body)['data'] as List;
    List<Tax> taxList = listFromJson.map((i) => new Tax.fromJSON(i)).toList();
    return taxList;
  }

}