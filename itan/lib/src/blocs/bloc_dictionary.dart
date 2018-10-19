import 'package:rxdart/rxdart.dart';
import '../models/dictionary.dart';
import '../models/constant.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class BlocDictionary {
  // VARS +
  String _token;

  List<Organization> organizationList;
  List<ResponsibilityCenter> responsibilityCenterList;
  List<BankAccount> bankAccountList;
  List<Counterparty> counterpartyList;
  List<CashFlow> cashFlowList;
  List<Tax> taxList;
  // VARS -

  // STREAMS +

  // STREAMS -

  BlocDictionary ();

  void setToken(String token) {
    this._token = token;
    getDictionaries();
  }

  void getDictionaries() {
    if (_token.isEmpty) return;
    getOrganizationList();
    getResponsibilityCenterList();
    getBankAccountList();
    getCounterpartyList();
    getCashFlowList();
    getTaxList();
  }

  void getOrganizationList() async {
    http.Response response = await http.get("$itanBaseUrl$itanDictionaryUrl?token=$_token&dictionary=organization&count=5000");
    String body = utf8.decode(response.bodyBytes);
    if (response.statusCode != 200) return;
    List<Object> listFromJson = jsonDecode(body)['data'] as List;
    organizationList = listFromJson.map((i) => new Organization.fromJSON(i)).toList();
  }

  void getResponsibilityCenterList() async {
    http.Response response = await http.get("$itanBaseUrl$itanDictionaryUrl?token=$_token&dictionary=ResponsibilityCenter&count=5000");
    String body = utf8.decode(response.bodyBytes);
    if (response.statusCode != 200) return;
    List<Object> listFromJson = jsonDecode(body)['data'] as List;
    responsibilityCenterList = listFromJson.map((i) => new ResponsibilityCenter.fromJSON(i)).toList();
  }

  void getBankAccountList() async {
    http.Response response = await http.get("$itanBaseUrl$itanDictionaryUrl?token=$_token&dictionary=BankAccount&count=5000");
    String body = utf8.decode(response.bodyBytes);
    if (response.statusCode != 200) return;
    List<Object> listFromJson = jsonDecode(body)['data'] as List;
    bankAccountList = listFromJson.map((i) => new BankAccount.fromJSON(i)).toList();
  }

  void getCounterpartyList() async {
    http.Response response = await http.get("$itanBaseUrl$itanDictionaryUrl?token=$_token&dictionary=Counterparty&count=5000");
    String body = utf8.decode(response.bodyBytes);
    if (response.statusCode != 200) return;
    List<Object> listFromJson = jsonDecode(body)['data'] as List;
    counterpartyList = listFromJson.map((i) => new Counterparty.fromJSON(i)).toList();
  }

  void getCashFlowList() async {
    http.Response response = await http.get("$itanBaseUrl$itanDictionaryUrl?token=$_token&dictionary=CashFlow&count=5000");
    String body = utf8.decode(response.bodyBytes);
    if (response.statusCode != 200) return;
    List<Object> listFromJson = jsonDecode(body)['data'] as List;
    cashFlowList = listFromJson.map((i) => new CashFlow.fromJSON(i)).toList();
  }

  void getTaxList() async {
    String body = r'{"data":'
      r'[{"index":0,"code":"НДС18","name":"18%"},'
      r'{"index":4,"code":"НДС0","name":"0%"},'
      r'{"index":5,"code":"БезНДС","name":"Без НДС"},'
      r'{"index":6,"code":"НДС20","name":"20%"}]}';
    List<Object> listFromJson = jsonDecode(body)['data'] as List;
    taxList = listFromJson.map((i) => new Tax.fromJSON(i)).toList();
  }
}