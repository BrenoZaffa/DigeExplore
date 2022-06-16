import 'package:digeexplore/enums/enum_orgaos_identificar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class BotaoOrgao extends StatelessWidget {
  final EnumOrgaosIdentificar orgao;
  final Function(EnumOrgaosIdentificar) onTap;
  const BotaoOrgao({
    Key? key,
    required this.orgao,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Color(orgao.getColor()),
          shape: const StadiumBorder(),
        ),
        onPressed: () => onTap(orgao),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 6),
                child: FaIcon(orgao.getIcon()),
              ),
              Text(
                orgao.name,
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
