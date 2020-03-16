import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseConfig {
  static final DatabaseConfig _instance = DatabaseConfig._();
  static Database _database;

  DatabaseConfig._();

  factory DatabaseConfig() {
    return _instance;
  }

  Future<Database> get db async {
    if (_database != null) {
      print('database is exist');
      return _database;
    } else {
      _database = await init();
      print('database created');
      print('ini databasenya $_database');
      return _database;
    }
  }

  Future<Database> init() async {
    Directory directory = await getApplicationDocumentsDirectory();
    print(directory);
    final database = openDatabase(
      join(directory.path, 'buddy_app.db'),
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE spend(id INTEGER PRIMARY KEY AUTOINCREMENT, description TEXT, cost INTEGER, created_at TEXT)",
        );
      },
      version: 1,
    );
    return database;
  }
}
