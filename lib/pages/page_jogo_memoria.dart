import 'package:digeexplore/widgets/jogo_memoria.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../enums/enum_dificuldade.dart';

class PageJogoMemoria extends StatefulWidget {
  final EnumDificuldade dificuldade;
  const PageJogoMemoria({Key? key, required this.dificuldade})
      : super(key: key);

  @override
  State<PageJogoMemoria> createState() => _PageJogoMemoriaState();
}

class _PageJogoMemoriaState extends State<PageJogoMemoria> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff073B4C),
      // appBar: AppBar(),
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Color(0xFFFF7D00),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(35),
                    topRight: Radius.circular(35),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Text(
                    'JOGO DA MEMÓRIA',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 26,
                    ),
                  ),
                ),
              ),
              JogoMemoria(dificuldade: widget.dificuldade),
            ],
          ),
        ),
      ),
    );
  }
}
