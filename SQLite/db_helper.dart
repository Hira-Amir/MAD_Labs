import 'package:path/path.dart';
import 'package:project/note.dart';
import 'package:sqflite/sqflite.dart';

class Dbhelper {
  Database? _database;
  Future<Database?> get database async {
    if (_database != null) {
      return _database;
    } else {
      _database = await initDb();
      return _database;
    }
  }

  Future<Database> initDb() async {
    final dbpath = await getDatabasesPath();
    final note_db_path = join(dbpath, 'not.db');
    final db = openDatabase(note_db_path, version: 1, onCreate: ((db, version) {
      db.execute(
          'CREATE TABLE notes(id INTEGER PRIMARY KEY, title TEXT, content TEXT)');
    }));
    return db;
  }

  insert(Note note) async {
    final db = await database;
    await db!.insert('notes',
        {'id': note.id, 'title': note.title, 'content': note.desscription},
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  update(Note note) async {
    final db = await database;
    await db!.update(
      'notes',
      {'id': note.id, 'title': note.title, 'content': note.desscription},
      where: "id = ?",
    );
  }

  delete(int id) async {
    final db = await database;
    await db!.delete(
      'notes',
      where: "id = ?",
      whereArgs: [id],
    );

    Future<List<Map<String, dynamic>>> quaryAll() async {
      final db = await database;
      return db!.query('notes');
    }
  }

  quaryAll() {}
}
