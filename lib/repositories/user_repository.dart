import 'package:digeexplore/class/DB.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class UserRepository extends ChangeNotifier {
  late Database db;
  String nome = "";

  UserRepository() {
    _initRepository();
  }

  _initRepository() async {
    await _getNome();
  }

  _getNome() async {
    db = await DB.instance.dataBase;
    List user = await db.query('usuario', limit: 1);
    if (user.isNotEmpty) {
      nome = user.first['nome'];
    }
    notifyListeners();
  }

  setNome(String nomeUser) async {
    db = await DB.instance.dataBase;
    db.update("usuario", {
      "nome": nomeUser,
    });
    nome = nomeUser;
    notifyListeners();
  }
}
