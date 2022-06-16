import 'package:digeexplore/enums/enum_dificuldade.dart';

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
        finalizarFase(0);
      }
    }
  }

  int calcularPontuacao(int tempoEmSegundos) {
    if (tempoEmSegundos > _dificuldade.tempoBaseParaConclusao()) {
      tempoEmSegundos = _dificuldade.tempoBaseParaConclusao();
    }

    return (tempoEmSegundos * dificuldade.pontosPorSegundo()).round() +
        (dificuldade.pontosPorVida * _quantidadeVidas);
  }

  void gerarFase();

  void finalizarFase(int tempoEmSegundos);
}
