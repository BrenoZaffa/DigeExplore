import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
    irParaJogo() {
      Navigator.pushNamed(context, jogoSelecionado);
    }

    return InkWell(
      onTap: irParaJogo,
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
                    fontSize: 24,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: SizedBox(
                height: 100,
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
