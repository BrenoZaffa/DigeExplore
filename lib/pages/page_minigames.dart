import 'package:digeexplore/widgets/widget_minigame.dart';
import 'package:flutter/material.dart';

class PageMiniGames extends StatelessWidget {
  const PageMiniGames({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff073B4C),
      appBar: AppBar(
        backgroundColor: const Color(0xff073B4C),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            WidgetMinigame(
              minigame: 'IDENTIFIQUE OS ÓRGÃOS',
              corDestaque: 0xffFF006D,
              imagemDestaque: 'assets/images/sistemaDigestorioImagem.png',
              jogoSelecionado: '/identifique_orgaos',
            ),
            WidgetMinigame(
              minigame: 'JOGO DA MEMÓRIA',
              corDestaque: 0xffFF7D00,
              imagemDestaque: 'assets/images/jogoMemoria.png',
              jogoSelecionado: '/jogo_memoria',
            ),
            WidgetMinigame(
              minigame: 'QUIZ',
              corDestaque: 0xff8F00FF,
              imagemDestaque: 'assets/images/quiz.png',
              jogoSelecionado: '/quiz',
            ),
          ],
        ),
      ),
    );
  }
}
