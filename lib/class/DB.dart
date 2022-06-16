import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DB {
  DB._();

  static final DB instance = DB._();
  static Database? _database;

  get dataBase async {
    if (_database == null) _database = await _initDatabase();

    return _database;
  }

  _initDatabase() async {
    return await openDatabase(
      join(await getDatabasesPath(), 'digeexplore.db'),
      version: 1,
      onCreate: _onCreate,
    );
  }

  _onCreate(db, version) async {
    await db.execute(_partida);
    await db.execute(_usuario);
  }

  String get _usuario => '''
    CREATE TABLE usuario (
      idUser INTEGER PRIMARY KEY AUTOINCREMENT,
      nome TEXT
    ); 
  ''';

  String get _partida => '''
    CREATE TABLE partida (
      idPartida INTEGER PRIMARY KEY AUTOINCREMENT,
      idMinigame INTEGER,
      Dificuldade INTEGER,
      Pontuacao_Total REAL
    );
  ''';
}
