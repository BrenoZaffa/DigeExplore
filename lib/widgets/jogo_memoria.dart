import 'package:digeexplore/class/finalizar_jogo_argument.dart';
import 'package:digeexplore/controllers/jogo_memoria_controller.dart';
import 'package:digeexplore/enums/enum_dificuldade.dart';
import 'package:digeexplore/enums/enum_orgaos.dart';
import 'package:digeexplore/widgets/carta_jogo_memoria.dart';
import 'package:digeexplore/widgets/tempo_jogo/tempo_jogo.dart';
import 'package:digeexplore/widgets/widget_cabecalho_jogo.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class JogoMemoria extends StatefulWidget {
  final EnumDificuldade dificuldade;
  const JogoMemoria({Key? key, required this.dificuldade}) : super(key: key);

  @override
  State<JogoMemoria> createState() => _JogoMemoriaState();
}

class _JogoMemoriaState extends State<JogoMemoria> {
  late var _jogoMemoriaController =
      JogoMemoriaController(EnumDificuldade.facil);
  List<EnumOrgaos> selecionadosErrado = [];
  late int tempoFinal;

  irParaPontuacaoFinal(int pontuacao) {
    Navigator.pushReplacementNamed(context, '/final_jogo',
        arguments: FinalizarJogoArgument('JOGO DA MEMÓRIA', pontuacao));
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      _jogoMemoriaController = JogoMemoriaController(widget.dificuldade);
    });
  }

  atribuirTempo(double animationValue) {
    if (animationValue == 1) {
      _jogoMemoriaController.finalizarFase(1, 0, 0);
    }

    const tempoMaximo = 120;

    tempoFinal = tempoMaximo - (animationValue * tempoMaximo).toInt();
  }

  void selecaoCarta(EnumOrgaos orgao) {
    if (_jogoMemoriaController.isOrgaoCorreto(orgao)) {
      SnackBar snackBar = const SnackBar(
        content: Text('Acertou! Parabéns!'),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      int pontos = _jogoMemoriaController.calcularPontuacao(tempoFinal);

      _jogoMemoriaController.finalizarFase(
        2,
        pontos,
        _jogoMemoriaController.dificuldade.getIdDificuldade(),
      );
      irParaPontuacaoFinal(pontos);
    } else {
      setState(() {
        selecionadosErrado.add(orgao);
        _jogoMemoriaController.descontaVida();
      });
      SnackBar snackBar = const SnackBar(
        content: Text('Tente novamente!'),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  Widget getCarta(EnumOrgaos orgao) {
    return !selecionadosErrado.contains(orgao) ||
            !_jogoMemoriaController.dificuldade.isFacil
        ? CartaJogoMemoria(
            orgao: orgao,
            onTap: selecaoCarta,
          )
        : Container(
            width: 150,
            // height: 170,
            height: 220,
            decoration: BoxDecoration(
              border: Border.all(
                color: const Color(0xFFDDDDDD),
                width: 32,
              ),
              borderRadius: BorderRadius.circular(20),
              color: const Color(0xFFDDDDDD),
            ),
          );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TempoJogo(
                onTempoTerminado: atribuirTempo,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 7),
                child: WidgetCabecalhoJogo(
                  quantidadeVidas: _jogoMemoriaController.quantidadeVidas,
                ),
              ),
            ],
          ),
          Column(
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
                        color: Color(
                            _jogoMemoriaController.orgaoCorreto.getColor()),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 520,
                decoration: const BoxDecoration(
                  color: Color(0xFFF2F2F2),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(35),
                    topRight: Radius.circular(35),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 30,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          getCarta(_jogoMemoriaController.orgaos[0]),
                          getCarta(_jogoMemoriaController.orgaos[1]),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            getCarta(_jogoMemoriaController.orgaos[2]),
                            if (_jogoMemoriaController.orgaos.length > 3)
                              getCarta(_jogoMemoriaController.orgaos[3])
                            else
                              const SizedBox(
                                width: 150,
                                height: 220,
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
