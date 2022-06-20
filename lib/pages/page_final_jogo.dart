import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../repositories/user_repository.dart';

class PageFinalJogo extends StatelessWidget {
  final String jogoFinalizado;
  final int pontuacao;

  const PageFinalJogo({
    Key? key,
    required this.jogoFinalizado,
    required this.pontuacao,
  }) : super(key: key);

  int getColor() {
    if (jogoFinalizado == 'JOGO DA MEMÓRIA') {
      return 0xFFFF7D00;
    } else if (jogoFinalizado == 'QUIZ') {
      return 0xFF8F00FF;
    } else if (jogoFinalizado == 'CAÇA-ORGÃOS') {
      return 0xFFFF006D;
    }

    return 0xFF000000;
  }

  @override
  Widget build(BuildContext context) {
    final userRepository = context.watch<UserRepository>();
    return Scaffold(
      backgroundColor: const Color(0xff073B4C),
      body: Padding(
        padding: const EdgeInsets.only(top: 32),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(35),
              topRight: Radius.circular(35),
            ),
          ),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(getColor()),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(35),
                    topRight: Radius.circular(35),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Text(
                    jogoFinalizado,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 23,
                    ),
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Center(
                      heightFactor: 2,
                      child: Text(
                        'Fase Concluída!',
                        style: GoogleFonts.poppins(
                          // color: Colors.white,01BEFE
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Center(
                  heightFactor: 2,
                  child: Text(
                    'Parabéns, continue assim!!! \n' + userRepository.nome,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      color: const Color(0xFF118AB2),
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                ),
              ),
              Center(
                heightFactor: 2,
                child: Text(
                  'Pontuação: $pontuacao/12000',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/home');
                  },
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 60,
                    ),
                    side: BorderSide(
                      color: Color(getColor()),
                    ),
                    primary: Color(getColor()),
                    shape: const StadiumBorder(),
                  ),
                  child: Text(
                    'Voltar para o início',
                    style: GoogleFonts.poppins(
                      // color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
