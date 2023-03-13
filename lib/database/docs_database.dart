import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../models/docs_pro.dart';


class DocsDatabase {
  static final DocsDatabase instance = DocsDatabase._init();
  static Database? _database;
  DocsDatabase._init();


  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await initDB('DocPro.db');
    return _database!;
  }

  Future<Database> initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future<void> _createDB(Database database, int version) async {
    DocProFields docProFields = DocProFields();

    await database.execute("CREATE TABLE ${docProFields.notesTableName}"
        "(${docProFields.notesId} TEXT PRIMARY KEY , "
        "${docProFields.notesTitle} TEXT NOT NULL,"
        "${docProFields.content} TEXT NOT NULL,"
        "${docProFields.notesCreatedOn} TEXT NOT NULL )",);

  }

  Future closeDB() async {
    final db = await instance.database;
    db.close();
  }

}