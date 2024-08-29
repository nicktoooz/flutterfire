
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'user.dart';

class AppDatabase {
  AppDatabase._init();

  static final AppDatabase instance = AppDatabase._init();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initializeDB('user_database.db');
    return _database!;
  }

  Future<Database> _initializeDB(String fileName) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, fileName);
    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }

  Future<void> _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE users (
        _id TEXT PRIMARY KEY,
        email TEXT,
        password TEXT
      )
    ''');
  }

  Future<void> signUp(User user) async {
    final db = await instance.database;
    await db.insert('users', user.toJson());
  }

  Future<User?> getUser(String uid) async {
    final db = await instance.database;
    final maps = await db.query(
      'users',
      columns: ['_id', 'email', 'password'],
      where: '_id = ?',
      whereArgs: [uid],
    );

    if (maps.isNotEmpty) {
      return User.fromJson(maps.first);
    } else {
      return null;
    }
  }
}
