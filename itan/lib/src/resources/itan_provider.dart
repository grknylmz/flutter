import '../models/constant.dart';
import '../models/user.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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
}