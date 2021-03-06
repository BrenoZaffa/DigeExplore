import 'package:digeexplore/enums/enum_dificuldade.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../pages/page_identifique_orgaos.dart';
import '../pages/page_jogo_memoria.dart';
import '../pages/page_quiz.dart';

class WidgetMinigame extends StatelessWidget {
  final String minigame;
  final int corDestaque;
  final String imagemDestaque;
  final String jogoSelecionado;

  const WidgetMinigame({
    Key? key,
    required this.minigame,
    required this.corDestaque,
    required this.imagemDestaque,
    required this.jogoSelecionado,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<void> _showMyDialog() async {
      irParaJogo(EnumDificuldade dificuldade) {
        // Navigator.pushReplacementNamed(context, jogoSelecionado, arguments: {
        //   "dificuldade": dificuldade,
        // });

        String video = "";
        switch (jogoSelecionado) {
          case '/identifique_orgaos':
            video = "tutorial_caca_orgao.mp4";
            break;
          case '/jogo_memoria':
            video = "tutorial_memoria.mp4";
            break;
          case '/quiz':
            video = "tutorial_quiz.mp4";
            break;
          default:
        }

        Navigator.of(context).pushNamed(
          '/video_conteudo',
          arguments: {
            'title': minigame,
            'color': corDestaque.toString(),
            'diretory': "assets/videos/" + video,
            'page': jogoSelecionado,
            'dificuldade': dificuldade,
          },
        );
      }

      return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            insetPadding: const EdgeInsets.all(10),
            contentPadding: const EdgeInsets.all(0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(35),
            ),
            content: Builder(builder: (context) {
              var height = MediaQuery.of(context).size.height;

              return SizedBox(
                height: height - 350,
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: Color(0xFF8F00FF),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(35),
                          topRight: Radius.circular(35),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: Text(
                          'ESCOLHA A DIFICULDADE',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 26,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 20,
                        left: 8,
                        right: 8,
                      ),
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          minimumSize: const Size(double.infinity - 10, 70),
                          primary: const Color(0xFFFF006D),
                          shape: const StadiumBorder(),
                          side: const BorderSide(
                            color: Color(0xFFFF006D),
                          ),
                        ),
                        onPressed: () => irParaJogo(EnumDificuldade.facil),
                        child: Text(
                          'F??CIL',
                          style: GoogleFonts.poppins(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 20,
                        left: 8,
                        right: 8,
                      ),
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          minimumSize: const Size(double.infinity - 10, 70),
                          primary: const Color(0xFFFF7D00),
                          shape: const StadiumBorder(),
                          side: const BorderSide(
                            color: Color(0xFFFF7D00),
                          ),
                        ),
                        onPressed: () => irParaJogo(EnumDificuldade.medio),
                        child: Text(
                          'M??DIO',
                          style: GoogleFonts.poppins(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 20,
                        left: 8,
                        right: 8,
                      ),
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          minimumSize: const Size(double.infinity - 10, 70),
                          primary: const Color(0xFF8F00FF),
                          shape: const StadiumBorder(),
                          side: const BorderSide(
                            color: Color(0xFF8F00FF),
                          ),
                        ),
                        onPressed: () => irParaJogo(EnumDificuldade.dificil),
                        child: Text(
                          'D??FICIL',
                          style: GoogleFonts.poppins(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),
          );
        },
      );
    }

    return InkWell(
      onTap: _showMyDialog,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.26,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                color: Color(corDestaque),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  minigame,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: SizedBox(
                height: 120,
                child: Image.asset(
                  imagemDestaque,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
