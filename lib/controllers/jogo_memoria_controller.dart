import 'dart:math';

import 'package:digeexplore/class/controlar_jogo.dart';
import 'package:digeexplore/enums/enum_dificuldade.dart';
import 'package:digeexplore/enums/enum_orgaos.dart';
import 'package:flutter/cupertino.dart';

class JogoMemoriaController extends ControlarJogo {
  late EnumOrgaos _orgaoCorreto;
  late List<EnumOrgaos> _orgaos = [];

  @override
  void gerarFase() {
    _orgaoCorreto =
        EnumOrgaos.values[Random().nextInt(EnumOrgaos.values.length)];
    _orgaos = getOrgaosRandomicos();
  }

  JogoMemoriaController(EnumDificuldade dificuldade) : super(dificuldade);

  EnumOrgaos get orgaoCorreto => _orgaoCorreto;

  List<EnumOrgaos> get orgaos => _orgaos;

  List<EnumOrgaos> getOrgaosRandomicos() {
    List<EnumOrgaos> listaOrgaos;
    do {
      listaOrgaos = EnumOrgaos.values.toList();

      listaOrgaos.shuffle();
      listaOrgaos.removeLast();

      if (!dificuldade.isDificil) {
        listaOrgaos.removeLast();
      }
    } while (!listaOrgaos.contains(_orgaoCorreto));

    return listaOrgaos;
  }

  bool isOrgaoCorreto(EnumOrgaos orgao) {
    return orgao == _orgaoCorreto;
  }

  @override
  finalizarFase(int tempoEmSegundos) {
    int valorFinalPontuacao = calcularPontuacao(tempoEmSegundos);

    // TODO SALVAR PONTUAÇÃO
  }
}
