import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AlternativaQuiz extends StatelessWidget {
  final String alternativa;
  final String letra;
  final Function(String) onTap;

  const AlternativaQuiz({
    Key? key,
    required this.alternativa,
    required this.letra,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(alternativa),
      child: Padding(
        padding: const EdgeInsets.only(top: 6),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          width: double.infinity,
          height: 60,
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xFF8F00FF)),
            borderRadius: const BorderRadius.all(Radius.circular(12.0)),
          ),
          child: Row(
            children: [
              Text(
                letra,
                style: GoogleFonts.poppins(
                  fontSize: 25,
                  color: const Color(0xFF3A86FF),
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Text(
                  alternativa,
                  style: GoogleFonts.poppins(
                    fontSize: 20,
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
