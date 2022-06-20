import 'package:digeexplore/class/finalizar_jogo_argument.dart';
import 'package:digeexplore/pages/page_ajuda.dart';
import 'package:digeexplore/pages/page_final_jogo.dart';
import 'package:digeexplore/pages/page_home.dart';
import 'package:digeexplore/pages/page_identifique_orgaos.dart';
import 'package:digeexplore/pages/page_jogo_memoria.dart';
import 'package:digeexplore/pages/page_minigames.dart';
import 'package:digeexplore/pages/page_ranking.dart';
import 'package:digeexplore/pages/page_sobre.dart';
import 'package:digeexplore/pages/page_quiz.dart';
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
            dificuldade: args['dificuldade'],
          );
        },
        "/ajuda": (context) => const PageAjuda(),
        "/sobre": (context) => const PageSobre(),
        "/ranking": (context) => const PageRanking(),
        "/home": (context) => const PageHome(),
        "/minigames": (context) => const PageMiniGames(),
        '/jogo_memoria': (context) {
          final args = ModalRoute.of(context)!.settings.arguments as Map;
          return PageJogoMemoria(
            dificuldade: args['dificuldade'],
          );
        },
        '/quiz': (context) {
          final args = ModalRoute.of(context)!.settings.arguments as Map;
          return PageQuiz(
            dificuldade: args['dificuldade'],
          );
        },
        '/identifique_orgaos': (context) {
          final args = ModalRoute.of(context)!.settings.arguments as Map;
          return PageIdentifiqueOrgaos(
            dificuldade: args['dificuldade'],
          );
        },
        // "/jogo_memoria": (context) => const PageJogoMemoria(),
        // "/quiz": (context) => const PageQuiz(),
        // "/identifique_orgaos": (context) => const PageIdentifiqueOrgaos(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/final_jogo') {
          final FinalizarJogoArgument args =
              settings.arguments as FinalizarJogoArgument;
          return MaterialPageRoute(
            builder: (context) {
              return PageFinalJogo(
                jogoFinalizado: args.jogoFinalizado,
                pontuacao: args.pontuacao,
              );
            },
          );
        }
        assert(false, 'Implementation ${settings.name}');
        return null;
      },
    );
  }
}
