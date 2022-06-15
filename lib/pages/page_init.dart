import 'package:digeexplore/class/finalizar_jogo_argument.dart';
import 'package:digeexplore/pages/page_final_jogo.dart';
import 'package:digeexplore/pages/page_home.dart';
import 'package:digeexplore/pages/page_jogo_memoria.dart';
import 'package:digeexplore/pages/page_minigames.dart';
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
        "/home": (context) => const PageHome(),
        "/minigames": (context) => const PageMiniGames(),
        "/jogo_memoria": (context) => const PageJogoMemoria(),
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
