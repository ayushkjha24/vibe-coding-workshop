import 'dart:async';
import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper.internal();
  factory DatabaseHelper() => _instance;

  static Database? _db;

  Future<Database> get db async {
    if (_db != null) {
      return _db!;
    }
    _db = await initDb();
    return _db!;
  }

  DatabaseHelper.internal();

  Future<Database> initDb() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'mylife_assistant.db');
    var theDb = await openDatabase(path, version: 1, onCreate: _onCreate);
    return theDb;
  }

  void _onCreate(Database db, int version) async {
    // Create tables
    await db.execute('''
      CREATE TABLE User(
        id INTEGER PRIMARY KEY,
        name TEXT,
        email TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE Habits(
        id INTEGER PRIMARY KEY,
        name TEXT,
        description TEXT,
        frequency TEXT,
        created_at TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE Routines(
        id INTEGER PRIMARY KEY,
        name TEXT,
        description TEXT,
        created_at TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE RoutineHabits(
        id INTEGER PRIMARY KEY,
        routine_id INTEGER,
        habit_id INTEGER,
        FOREIGN KEY (routine_id) REFERENCES Routines(id),
        FOREIGN KEY (habit_id) REFERENCES Habits(id)
      )
    ''');

    await db.execute('''
      CREATE TABLE Goals(
        id INTEGER PRIMARY KEY,
        name TEXT,
        description TEXT,
        target_date TEXT,
        created_at TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE Preferences(
        id INTEGER PRIMARY KEY,
        key TEXT,
        value TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE MoodLogs(
        id INTEGER PRIMARY KEY,
        mood TEXT,
        notes TEXT,
        created_at TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE SleepPatterns(
        id INTEGER PRIMARY KEY,
        start_time TEXT,
        end_time TEXT,
        quality INTEGER,
        created_at TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE WorkPatterns(
        id INTEGER PRIMARY KEY,
        start_time TEXT,
        end_time TEXT,
        description TEXT,
        created_at TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE ActivityLogs(
        id INTEGER PRIMARY KEY,
        activity_type TEXT,
        duration INTEGER,
        notes TEXT,
        created_at TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE Notes(
        id INTEGER PRIMARY KEY,
        title TEXT,
        content TEXT,
        created_at TEXT,
        updated_at TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE Tags(
        id INTEGER PRIMARY KEY,
        name TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE NoteTags(
        id INTEGER PRIMARY KEY,
        note_id INTEGER,
        tag_id INTEGER,
        FOREIGN KEY (note_id) REFERENCES Notes(id),
        FOREIGN KEY (tag_id) REFERENCES Tags(id)
      )
    ''');

    await db.execute('''
      CREATE TABLE Events(
        id INTEGER PRIMARY KEY,
        title TEXT,
        description TEXT,
        start_time TEXT,
        end_time TEXT,
        created_at TEXT
      )
    ''');
  }
}
