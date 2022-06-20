import 'package:digeexplore/class/DB.dart';
import 'package:digeexplore/class/partida.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class PartidaRepository extends ChangeNotifier {
  late Database db;
  List<Map> partidas = [];

  PartidaRepository() {
    _initRepository();
  }

  _initRepository() async {
    await getPartidas();
  }

  getPartidas() async {
    db = await DB.instance.dataBase;
    partidas =
        await db.query("partida", orderBy: "Pontuacao_Total DESC") as List<Map>;
    notifyListeners();
  }

  limparDados() async {
    db = await DB.instance.dataBase;
    await db.delete('partida');
    partidas = [];
    notifyListeners();
  }

  insertPartida(Partida partida) async {
    db = await DB.instance.dataBase;
    await db.insert(
      'partida',
      {
        'idMinigame': partida.idMinigame,
        'Pontuacao_Total': partida.Pontuacao_Total,
        'Dificuldade': partida.Dificuldade,
      },
    );
    getPartidas();
  }
}
