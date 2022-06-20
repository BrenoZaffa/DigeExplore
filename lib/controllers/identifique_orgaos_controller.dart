import 'dart:math';

import 'package:digeexplore/enums/enum_dificuldade.dart';
import 'package:digeexplore/enums/enum_orgaos_identificar.dart';

import '../class/controlar_jogo.dart';

class IdentifiqueOrgaosController extends ControlarJogo {
  late EnumOrgaosIdentificar _orgaoCorreto;
  late List<EnumOrgaosIdentificar> _orgaos = [];

  IdentifiqueOrgaosController(EnumDificuldade dificuldade) : super(dificuldade);

  EnumOrgaosIdentificar get orgaoCorreto => _orgaoCorreto;

  List<EnumOrgaosIdentificar> get orgaos => _orgaos;

  List<EnumOrgaosIdentificar> getOrgaosRandomicos() {
    List<EnumOrgaosIdentificar> listaOrgaos;
    do {
      listaOrgaos = EnumOrgaosIdentificar.values.toList();

      listaOrgaos.shuffle();
      listaOrgaos.removeLast();

      if (!dificuldade.isDificil) {
        listaOrgaos.removeLast();
      }
    } while (!listaOrgaos.contains(_orgaoCorreto));

    return listaOrgaos;
  }

  bool isOrgaoCorreto(EnumOrgaosIdentificar orgao) {
    return orgao == _orgaoCorreto;
  }

  // @override
  // void finalizarFase(int tempoEmSegundos) {
  //   int valorFinalPontuacao = calcularPontuacao(tempoEmSegundos);

  //   // TODO SALVAR PONTUAÇÃO
  // }

  @override
  void gerarFase() {
    _orgaoCorreto = EnumOrgaosIdentificar
        .values[Random().nextInt(EnumOrgaosIdentificar.values.length)];
    _orgaos = getOrgaosRandomicos();
  }
}
