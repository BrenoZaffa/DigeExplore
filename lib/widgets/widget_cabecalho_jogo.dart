import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WidgetCabecalhoJogo extends StatelessWidget {
  final int quantidadeVidas;
  const WidgetCabecalhoJogo({
    Key? key,
    this.quantidadeVidas = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: const Color(0xFFF2F2F2),
              shape: const StadiumBorder(),
            ),
            onPressed: () {},
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Column(
                children: [
                  const Icon(
                    Icons.question_mark,
                    color: Colors.black87,
                    size: 28,
                  ),
                  Text(
                    'AJUDA',
                    style: GoogleFonts.poppins(
                      color: Colors.black87,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Row(
            children: [
              (quantidadeVidas >= 3)
                  ? const Icon(
                      Icons.favorite,
                      size: 35,
                      color: Color(0xFFE23636),
                    )
                  : const Icon(
                      Icons.heart_broken,
                      size: 35,
                      color: Color(0xFFF3A0A0),
                    ),
              (quantidadeVidas >= 2)
                  ? const Icon(
                      Icons.favorite,
                      size: 35,
                      color: Color(0xFFE23636),
                    )
                  : const Icon(
                      Icons.heart_broken,
                      size: 35,
                      color: Color(0xFFF3A0A0),
                    ),
              (quantidadeVidas >= 1)
                  ? const Icon(
                      Icons.favorite,
                      size: 35,
                      color: Color(0xFFE23636),
                    )
                  : const Icon(
                      Icons.heart_broken,
                      size: 35,
                      color: Color(0xFFF3A0A0),
                    ),
            ],
          )
        ],
      ),
    );
  }
}
