import 'package:miniproject/models/progress_models/progress_model.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static DatabaseHelper? _databaseHelper;
  static Database? _database;

  DatabaseHelper._internal() {
    _databaseHelper = this;
  }

  factory DatabaseHelper() => _databaseHelper ?? DatabaseHelper._internal();

  Future<Database> get database async {
    _database = await _initializeDB();
    return _database!;
  }

  final String tableName = "progress";

  Future<Database> _initializeDB() async {
    var db = await openDatabase(
      'progress.db',
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''CREATE TABLE $tableName(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          title TEXT,
          content TEXT,
          imagePath TEXT
        )''');
      },
    );
    return db;
  }

  Future<void> insertProgress(ProgressModel progressModel) async {
    final Database db = await database;
    await db.insert(tableName, progressModel.toMap());
  }

  Future<List<ProgressModel>> getProgress() async {
    final Database db = await database;
    List<Map<String, dynamic>> result = await db.query(tableName);
    return result.map((e) => ProgressModel.fromMap(e)).toList();
  }

  Future<ProgressModel> getProgressById(int id) async {
    final Database db = await database;
    List<Map<String, dynamic>> result = await db.query(
      tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
    return result.map((e) => ProgressModel.fromMap(e)).first;
  }

  Future<void> updateProgress(ProgressModel progressModel) async {
    final Database db = await database;
    await db.update(
      tableName,
      progressModel.toMap(),
      where: 'id = ?',
      whereArgs: [progressModel.id],
    );
  }

  Future<void> deleteProgress(int id) async {
    final Database db = await database;
    await db.delete(
      tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
