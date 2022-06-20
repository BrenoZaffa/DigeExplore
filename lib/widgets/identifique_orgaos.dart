import 'package:digeexplore/class/finalizar_jogo_argument.dart';
import 'package:digeexplore/controllers/identifique_orgaos_controller.dart';
import 'package:digeexplore/enums/enum_dificuldade.dart';
import 'package:digeexplore/enums/enum_orgaos_identificar.dart';
import 'package:digeexplore/widgets/botao_orgao.dart';
import 'package:digeexplore/widgets/tempo_jogo/tempo_jogo.dart';
import 'package:digeexplore/widgets/widget_cabecalho_jogo.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class IdentiqueOrgaos extends StatefulWidget {
  final EnumDificuldade dificuldade;
  const IdentiqueOrgaos({Key? key, required this.dificuldade})
      : super(key: key);

  @override
  State<IdentiqueOrgaos> createState() => _IdentiqueOrgaosState();
}

class _IdentiqueOrgaosState extends State<IdentiqueOrgaos> {
  late var _identifiqueOrgaosController =
      IdentifiqueOrgaosController(EnumDificuldade.facil);

  List<EnumOrgaosIdentificar> selecionadosErrado = [];
  late int tempoFinal = 0;

  irParaPontuacaoFinal(int pontuacao) {
    Navigator.pushReplacementNamed(context, '/final_jogo',
        arguments: FinalizarJogoArgument('CAÇA-ORGÃOS', pontuacao));
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      _identifiqueOrgaosController =
          IdentifiqueOrgaosController(widget.dificuldade);
    });
  }

  atribuirTempo(double animationValue) {
    if (animationValue == 1) {
      _identifiqueOrgaosController.finalizarFase(1, 0, 0);
    }

    const tempoMaximo = 120;

    tempoFinal = tempoMaximo - (animationValue * tempoMaximo).toInt();
  }

  void selecaoBotao(EnumOrgaosIdentificar orgao) {
    if (_identifiqueOrgaosController.isOrgaoCorreto(orgao)) {
      SnackBar snackBar = const SnackBar(
        content: Text('Acertou! Parabéns!'),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      int pontos = _identifiqueOrgaosController.calcularPontuacao(tempoFinal);

      _identifiqueOrgaosController.finalizarFase(
        1,
        pontos,
        _identifiqueOrgaosController.dificuldade.getIdDificuldade(),
      );
      irParaPontuacaoFinal(pontos);
    } else {
      setState(() {
        selecionadosErrado.add(orgao);
        _identifiqueOrgaosController.descontaVida();
      });
      SnackBar snackBar = const SnackBar(
        content: Text('Tente novamente!'),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  Widget getBotao(EnumOrgaosIdentificar orgao) {
    return !selecionadosErrado.contains(orgao) ||
            !_identifiqueOrgaosController.dificuldade.isFacil
        ? BotaoOrgao(
            orgao: orgao,
            onTap: selecaoBotao,
          )
        : Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: const Color(0xFFDDDDDD),
                shape: const StadiumBorder(),
              ),
              onPressed: () {},
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

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TempoJogo(
            onTempoTerminado: atribuirTempo,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 7),
            child: WidgetCabecalhoJogo(
              quantidadeVidas: _identifiqueOrgaosController.quantidadeVidas,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset(_identifiqueOrgaosController.orgaoCorreto.getAsset()),
              Container(
                width: 90,
                height: 90,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: const Color(0xFFF2F2F2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('DICA:',
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        )),
                    Icon(
                      _identifiqueOrgaosController.orgaoCorreto.getIcon(),
                      color: Color(
                        _identifiqueOrgaosController.orgaoCorreto.getColor(),
                      ),
                      size: 30,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              // horizontal: 2,
              vertical: 10,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    getBotao(_identifiqueOrgaosController.orgaos[0]),
                    getBotao(_identifiqueOrgaosController.orgaos[1]),
                  ],
                ),
                Row(
                  children: [
                    getBotao(_identifiqueOrgaosController.orgaos[2]),
                    if (_identifiqueOrgaosController.orgaos.length > 3)
                      getBotao(_identifiqueOrgaosController.orgaos[3]),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
