import 'package:digeexplore/class/partida.dart';
import 'package:digeexplore/enums/enum_dificuldade.dart';

import '../repositories/partida_repository.dart';

abstract class ControlarJogo {
  int _quantidadeVidas = 3;
  late EnumDificuldade _dificuldade;

  ControlarJogo(dificuldade) {
    _dificuldade = dificuldade;
    gerarFase();
  }

  int get quantidadeVidas => _quantidadeVidas;

  EnumDificuldade get dificuldade => _dificuldade;

  void descontaVida() {
    if (_quantidadeVidas > 0) {
      _quantidadeVidas--;

      if (_quantidadeVidas == 0) {
        finalizarFase(0, 0, 0);
      }
    }
  }

  int calcularPontuacao(int tempoEmSegundos) {
    if (tempoEmSegundos > _dificuldade.tempoBaseParaConclusao()) {
      tempoEmSegundos = _dificuldade.tempoBaseParaConclusao();
    }

    return (tempoEmSegundos * _dificuldade.pontosPorSegundo()).round() +
        (_dificuldade.pontosPorVida * _quantidadeVidas);
  }

  void gerarFase();

  void finalizarFase(int idMinigame, int pontos, int idDificuldade) {
    if (idDificuldade != 0) {
      PartidaRepository partidaRepository = PartidaRepository();
      Partida partida = Partida(
        idMinigame: idMinigame,
        Dificuldade: idDificuldade,
        Pontuacao_Total: pontos,
      );
      partidaRepository.insertPartida(partida);
    }
  }
}
