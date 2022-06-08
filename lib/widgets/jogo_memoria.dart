import 'package:digeexplore/controllers/jogo_memoria_controller.dart';
import 'package:digeexplore/enums/enum_orgaos.dart';
import 'package:digeexplore/widgets/carta_jogo_memoria.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class JogoMemoria extends StatefulWidget {
  const JogoMemoria({Key? key}) : super(key: key);

  @override
  State<JogoMemoria> createState() => _JogoMemoriaState();
}

class _JogoMemoriaState extends State<JogoMemoria> {
  final _jogoMemoriaController = JogoMemoriaController();

  @override
  void initState() {
    super.initState();
  }

  void selecaoCarta(EnumOrgaos orgao) {
    if (_jogoMemoriaController.isOrgaoCorreto(orgao)) {
      SnackBar snackBar = const SnackBar(
        content: Text('Acertou! Parabéns!'),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);

      // TODO TENTEI FAZER UM RESET DA LISTA DE ORGAOS, MAS NÃO FUNCIONOU
      // Timer(
      //   const Duration(milliseconds: 2000),
      //   _jogoMemoriaController.reset(),
      // );
      // setState(() {});
    } else {
      SnackBar snackBar = const SnackBar(
        content: Text('Tente novamente!'),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 2, bottom: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'ENCONTRE ',
                style: GoogleFonts.poppins(
                  fontSize: 20,
                ),
              ),
              Text(
                _jogoMemoriaController.orgaoCorreto.name,
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  color: Color(_jogoMemoriaController.orgaoCorreto.getColor()),
                ),
              ),
            ],
          ),
        ),
        Container(
          decoration: const BoxDecoration(
            color: Color(0xFFF2F2F2),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(35),
              topRight: Radius.circular(35),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(
              top: 15,
              bottom: 15,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Text(_jogoMemoriaController.getOrgaosRandomicos().toString()),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CartaJogoMemoria(
                      orgao: _jogoMemoriaController.orgaos[0],
                      onTap: selecaoCarta,
                    ),
                    CartaJogoMemoria(
                      orgao: _jogoMemoriaController.orgaos[1],
                      onTap: selecaoCarta,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CartaJogoMemoria(
                        orgao: _jogoMemoriaController.orgaos[2],
                        onTap: selecaoCarta,
                      ),
                      CartaJogoMemoria(
                        orgao: _jogoMemoriaController.orgaos[3],
                        onTap: selecaoCarta,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
