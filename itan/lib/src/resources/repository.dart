import 'package:rxdart/rxdart.dart';

import '../models/payment.dart';
import '../models/dictionary.dart';
import '../models/constant.dart';
import '../models/user.dart';

//export '../models/constant.dart';
//export '../models/user.dart';
//export '../models/dictionary.dart';
//export '../models/payment.dart';

import 'db_provider.dart';
import 'auth_provider.dart';
import 'itan_provider.dart';
import 'dart:async';

class Repository {
  DBProvider dbProvider = new DBProvider();
  AuthProvider authProvider = new AuthProvider();
  ITANProvider itanProvider = new ITANProvider();

  Future<User> fetchUser() async {
    User user = await dbProvider.fetchUser();

    if (user != null )
      user = await itanProvider.updateUser(user);
    if (user != null )
      return user;

    Map<String, dynamic> map = await authProvider.getGoogleUser();
    user = await itanProvider.getUserFromMap(map);
    dbProvider.addUser(user); // add to db

    return user;
  }

  logout(user) async {
    if (user == null) return;
    authProvider.logout();
    itanProvider.logout(user);
    dbProvider.logout(user);
  }

  // Получить заявки на оплату
  void updatePayments(User user, BehaviorSubject<List<Payment>> _paymentsListController) async {
    List<Payment> paymentsList = await itanProvider.getPayments(user);
    _paymentsListController.add(paymentsList);
  }

  // Получить справочники
  void updateOrganizationList(User user, BehaviorSubject<List<Organization>> subject) async {
    subject.add(await itanProvider.getOrganizationList(user));
  }
  void updateResponsibilityCenterList(User user, BehaviorSubject<List<ResponsibilityCenter>> subject) async {
    subject.add(await itanProvider.getResponsibilityCenterList(user));
  }
  void updateBankAccountList(User user, BehaviorSubject<List<BankAccount>> subject) async {
    subject.add(await itanProvider.getBankAccountList(user));
  }
  void updateCounterpartyList(User user, BehaviorSubject<List<Counterparty>> subject) async {
    subject.add(await itanProvider.getCounterpartyList(user));
  }
  void updateCashFlowList(User user, BehaviorSubject<List<CashFlow>> subject) async {
    subject.add(await itanProvider.getCashFlowList(user));
  }
  void updateTaxList(User user, BehaviorSubject<List<Tax>> subject) async {
    subject.add(await itanProvider.getTaxList(user));
  }

}