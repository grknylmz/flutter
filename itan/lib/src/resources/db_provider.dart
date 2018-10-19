// DB
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:path/path.dart';
import '../models/user.dart';
export '../models/user.dart';
import 'dart:async';

class DBProvider {
  Database db;

  DBProvider() {
    if (db == null)
      init();
  }

  void init() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final String path = join(documentsDirectory.path, 'itan.db');
    db = await openDatabase(
      path,
      version: 1,
      onCreate: (Database newDB, int version) {
        newDB.execute("""
          CREATE TABLE Users
          (
              token         TEXT PRIMARY KEY
            , code          TEXT
            , name          TEXT
            , email         TEXT
            , picURL        TEXT
            , picBase64     BLOB
            , creationDate  INTEGER
          )
        """);
      },
    );

  }

  Future<User> fetchUser() async {
    if (db == null) return null; // Ошибка, видимо подключение к бд до сих пор не установлено
    final List<Map<String, dynamic>> maps = await db.query(
      'Users',
      limit: 1,
      //orderBy: "creationDate DESC",
    );
    if (maps.length != 1) return null;
    final User user = User.fromDB(maps.last);
    return user;
  }

  Future<int> addUser(User user) async {
    Map<String, dynamic> map = user.toMapForDB();
    return db.insert("Users", map);
  }

  logout(User user) async {
    // TODO: create remove from db
  }
}