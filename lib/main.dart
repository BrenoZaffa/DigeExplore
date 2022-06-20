import 'package:digeexplore/pages/page_init.dart';
import 'package:digeexplore/repositories/partida_repository.dart';
import 'package:digeexplore/repositories/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserRepository()),
        ChangeNotifierProvider(create: (context) => PartidaRepository()),
      ],
      child: PageInit(),
    ),
  );
}
