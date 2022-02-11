import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  late Future<Database> _db;

  Future<Database> getDatabase() {
    _db = _initDB();
    return _db;
  }

  Future<Database> _initDB() async {
    WidgetsFlutterBinding.ensureInitialized();
    return openDatabase(join(await getDatabasesPath(), 'bookaway.db'),
        version: 1, onCreate: (Database db, int version) async {
      await db.execute("""
        CREATE TABLE users(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          name TEXT NOT NULL,
          email TEXT,
          team_id INTEGER 
        )""");
      await db.execute("""
        CREATE TABLE teams(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          name TEXT NOT NULL
        )""");
      await db.execute("""
        CREATE TABLE open_game(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          author_id INTEGER NOT NULL,
          created_date DATETIME NOT NULL,
          status INTEGER NOT NULL,
          type INTEGER NOT NULL
        )""");
      await db.execute("""
        CREATE TABLE open_game_players(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          player_id INTEGER NOT NULL,
          game_id INTEGER NOT NULL,
          updated_date DATETIME NOT NULL,
          status INTEGER NOT NULL
        )""");
    });
  }
}
