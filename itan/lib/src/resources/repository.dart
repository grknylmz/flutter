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
    dbProvider.addUser(user);

    return user;
  }

  logout(user) async {
    if (user == null) return;
    authProvider.logout();
    itanProvider.logout(user);
    dbProvider.logout(user);
  }

}