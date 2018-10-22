import 'package:rxdart/rxdart.dart';
import 'dart:async';
// Provider
import 'bloc_provider.dart';
// Логика
import '../resources/repository.dart';

import '../models/payment.dart';
import '../models/dictionary.dart';
import '../models/constant.dart';
import '../models/user.dart';


class ApplicationBloc implements BlocBase {
  // VARS +
  Repository repository = new Repository();

  // Dictionary
  //  List<Organization> organizationList;
  //  List<ResponsibilityCenter> responsibilityCenterList;
  //  List<BankAccount> bankAccountList;
  //  List<Counterparty> counterpartyList;
  //  List<CashFlow> cashFlowList;
  //  List<Tax> taxList;
  // VARS -

  // STREAMS +
  // USER
  final BehaviorSubject<User> _userSubject = BehaviorSubject<User>();
  Stream<User> get userStream => _userSubject.stream;

  // payment list
  final BehaviorSubject<List<Payment>> paymentsListSubject = BehaviorSubject<List<Payment>>();

  // Current payment
  BehaviorSubject<List<Organization>> organizationListSubject = BehaviorSubject<List<Organization>>();
  BehaviorSubject<List<Counterparty>> counterpartyListSubject = BehaviorSubject<List<Counterparty>>();
  BehaviorSubject<List<ResponsibilityCenter>> responsibilityCenterListSubject = BehaviorSubject<List<ResponsibilityCenter>>();
  BehaviorSubject<List<BankAccount>> bankAccountListSubject = BehaviorSubject<List<BankAccount>>();
  BehaviorSubject<List<CashFlow>> cashFlowListSubject = BehaviorSubject<List<CashFlow>>();
  BehaviorSubject<List<Tax>> taxListSubject = BehaviorSubject<List<Tax>>();

  // Current payment
  BehaviorSubject<String> currentOrganizationSubject = BehaviorSubject<String>();
  BehaviorSubject<String> currentCounterpartySubject = BehaviorSubject<String>();
  BehaviorSubject<String> currentResponsibilityCenterSubject = BehaviorSubject<String>();
  BehaviorSubject<String> currentBankAccountSubject = BehaviorSubject<String>();
  BehaviorSubject<String> currentCashFlowSubject = BehaviorSubject<String>();
  BehaviorSubject<String> currentTaxSubject = BehaviorSubject<String>();
  BehaviorSubject<double> currentDocumentTotalSubject = BehaviorSubject<double>();
  // STREAMS -


  //
  // Constructor
  //
  ApplicationBloc() {
//    // Подписываем на потоки
//    userStream.listen(
//            (user) => () {
//              repository.updatePayments(user, paymentsListSubject);
//              repository.updateBankAccountList(user, bankAccountListSubject);
//              repository.updateCashFlowList(user, cashFlowListSubject);
//              repository.updateCounterpartyList(user, counterpartyListSubject);
//              repository.updateOrganizationList(user, organizationListSubject);
//              repository.updateResponsibilityCenterList(user, responsibilityCenterListSubject);
//              repository.updateTaxList(user, taxListSubject);
//            }
//    ); // обновить список заявок на оплату при смене пользователя
    userStream.listen((user) => repository.updatePayments(user, paymentsListSubject));
    userStream.listen((user) => repository.updateBankAccountList(user, bankAccountListSubject));
    userStream.listen((user) => repository.updateCashFlowList(user, cashFlowListSubject));
    userStream.listen((user) => repository.updateCounterpartyList(user, counterpartyListSubject));
    userStream.listen((user) => repository.updateOrganizationList(user, organizationListSubject));
    userStream.listen((user) => repository.updateResponsibilityCenterList(user, responsibilityCenterListSubject));
    userStream.listen((user) => repository.updateTaxList(user, taxListSubject));


    // Функции при старте

    // Прежде чем авторизоваться надо подождать,
    // пока будет установлено подключение к базе данных в
    // repository.dbProvider.db
    new Future.delayed(const Duration(seconds: 1), () => login());
  }

  // Авторизуюсь
  login() async {
    User user = await repository.fetchUser();
    if (user == null) return;
    _userSubject.add(user);
  }

  // Меняю аккаунт
  changeAccount() async {
    await logout();
    await login();
  }

  // Разлогиниваюсь
  logout() async {
    repository.logout(_userSubject.value);
  }

  // Завершаю работу с программой и убиваю потоки
  dispose() {
    // User
    _userSubject.close();

    // Payment list
    paymentsListSubject.close();

    // Documents
    organizationListSubject.close();
    counterpartyListSubject.close();
    responsibilityCenterListSubject.close();
    bankAccountListSubject.close();
    cashFlowListSubject.close();
    taxListSubject.close();

    // Current payment
    currentOrganizationSubject.close();
    currentCounterpartySubject.close();
    currentResponsibilityCenterSubject.close();
    currentBankAccountSubject.close();
    currentCashFlowSubject.close();
    currentTaxSubject.close();
    currentDocumentTotalSubject.close();
  }

}