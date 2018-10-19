// Абстрактный класс справочника
abstract class Dictionary {
  String id         = "";
  String code       = "";
  String name       = "";
  bool markOnRemove = false;

  Dictionary();
  Dictionary.fromJSON(Map<String, dynamic> parsedJson) {
    if (parsedJson==null) return;
    id = parsedJson['id'] ?? "";
    code = parsedJson['code'] ?? "";
    name = parsedJson['name'] ?? "";
    markOnRemove = parsedJson['markOnRemove'] ?? false;
  }
}

// Центр ответсвенности
class ResponsibilityCenter extends Dictionary {
  ResponsibilityCenter();
  ResponsibilityCenter.fromJSON(Map<String, dynamic> parsedJson):super.fromJSON(parsedJson);
}

// ДС: Виды платежных операций (УБИ)
class TypeOfPaymentTransaction extends Dictionary {
  TypeOfPaymentTransaction();
  TypeOfPaymentTransaction.fromJSON(Map<String, dynamic> parsedJson):super.fromJSON(parsedJson);
}

// Статьи движения денежных средств
class CashFlow extends Dictionary {
  CashFlow();
  CashFlow.fromJSON(Map<String, dynamic> parsedJson):super.fromJSON(parsedJson);
}

// ДС: Средства оплаты (УБИ)
class BankAccount extends Dictionary {
  BankAccount();
  BankAccount.fromJSON(Map<String, dynamic> parsedJson):super.fromJSON(parsedJson);
}

// Пользователи (УБИ)
class Responsible extends Dictionary {
  Responsible();
  Responsible.fromJSON(Map<String, dynamic> parsedJson):super.fromJSON(parsedJson);
}

// Валюты
class Currency extends Dictionary {
  Currency();
  Currency.fromJSON(Map<String, dynamic> parsedJson):super.fromJSON(parsedJson);
}

// Организации
class Organization extends Dictionary {
  Organization();
  Organization.fromJSON(Map<String, dynamic> parsedJson):super.fromJSON(parsedJson);
}

// Контрагенты
class Counterparty extends Dictionary {
  Counterparty();
  Counterparty.fromJSON(Map<String, dynamic> parsedJson):super.fromJSON(parsedJson);
}

// Договоры
class Contract extends Dictionary {
  Contract();
  Contract.fromJSON(Map<String, dynamic> parsedJson):super.fromJSON(parsedJson);
}

// Виды расчетов
class TypeOfPayment extends Dictionary {
  TypeOfPayment();
  TypeOfPayment.fromJSON(Map<String, dynamic> parsedJson):super.fromJSON(parsedJson);
}

// Тип документа
class DocumentType {
  static const String meta = "Документ";
  String name;
  String description;
  String codeType;

  DocumentType();
  DocumentType.fromJSON(Map<String, dynamic> parsedJson) {
    if (parsedJson == null) return;
    name = parsedJson['name'] ?? "";
    description = parsedJson['description'] ?? "";
    codeType = parsedJson['codeType'] ?? "";
  }
}

// Тип справочника
class DictionaryType  {
  static const String meta = "Справочник";
  String name;
  String description;
  String codeType;

  DictionaryType();
  DictionaryType.fromJSON(Map<String, dynamic> parsedJson) {
    if (parsedJson == null) return;
    name = parsedJson['name'] ?? "";
    description = parsedJson['description'] ?? "";
    codeType = parsedJson['codeType'] ?? "";
  }
}