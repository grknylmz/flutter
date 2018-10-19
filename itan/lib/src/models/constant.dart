// Google API
const String googleClientID = "640254302662-okid34prr0gknqkj8sou5cm344f89iap.apps.googleusercontent.com";
const String googleClientSecret = "PRVHCB4F-de4PPidUlvzzrcZ";

// ITAN API
const String itanBaseUrl = 'http://vds495.1cbit.ru:15535/itan/hs/api/';
const String itanPaymentsUrl = 'payment';
const String itanDictionaryUrl = 'dictionary';
const String itanUserUrl = 'user';
const String itanLogoutUrl = 'logout';

// Перечисление
abstract class Enumeration {
  int index;
  String code;
  String name;

  Enumeration();
  Enumeration.fromJSON(Map<String, dynamic> parsedJson) {
    if (parsedJson == null) return;
    index = parsedJson['index'];
    code = parsedJson['code'];
    name = parsedJson['name'];
  }
}

// Состояния визирования (УБИ)
class SightingState extends Enumeration {
  SightingState();
  SightingState.fromJSON(Map<String, dynamic> parsedJson):super.fromJSON(parsedJson);
}

// Ставки НДС
class Tax extends Enumeration {
  Tax();
  Tax.fromJSON(Map<String, dynamic> parsedJson):super.fromJSON(parsedJson);

  Tax.fromCode(String code) {
    switch(code) {
      case "НДС18": {
        index = 0;
        code = "НДС18";
        name = "18%";
      }
      break;
      case "НДС18_118": {
        index = 1;
        code = "НДС18_118";
        name = "18/118";
      }
      break;
      case "НДС10": {
        index = 2;
        code = "НДС10";
        name = "10%";
      }
      break;
      case "НДС10_110": {
        index = 3;
        code = "НДС10_110";
        name = "10/110";
      }
      break;
      case "НДС0": {
        index = 4;
        code = "НДС0";
        name = "0%";
      }
      break;
      case "БезНДС": {
        index = 5;
        code = "БезНДС";
        name = "Без НДС";
      }
      break;
      case "НДС20": {
        index = 6;
        code = "НДС20";
        name = "20%";
      }
      break;
      case "НДС20_120": {
        index = 7;
        code = "НДС20_120";
        name = "20/120";
      }
      break;
      default: {
        index = 5;
        code = "БезНДС";
        name = "Без НДС";
      }
      break;
    }
  }
}