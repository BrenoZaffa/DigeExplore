import 'package:digeexplore/pages/page_home.dart';
import 'package:digeexplore/pages/page_jogo_memoria.dart';
import 'package:digeexplore/pages/page_minigames.dart';
import 'package:digeexplore/pages/page_sobre.dart';
import 'package:digeexplore/pages/page_video_conteudo.dart';
import 'package:digeexplore/pages/splash_page.dart';
import 'package:flutter/material.dart';

class PageInit extends StatelessWidget {
  const PageInit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: 'DigeExplore',
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(
      //   primarySwatch: Colors.red,
      // ),
      home: const SplashPage(),
      routes: {
        '/video_conteudo': (context) {
          final args = ModalRoute.of(context)!.settings.arguments as Map;
          return PageVideoConteudo(
            title: args['title'],
            color: args['color'],
            diretory: args['diretory'],
            page: args['page'],
          );
        },
        "/sobre": (context) => const PageSobre(),
        "/home": (context) => const PageHome(),
        "/minigames": (context) => const PageMiniGames(),
        "/jogo_memoria": (context) => const PageJogoMemoria(),
      },
    );
  }
}
