import 'package:digeexplore/enums/enum_dificuldade.dart';

abstract class ControlarJogo {
  int _quantidadeVidas = 3;
  late EnumDificuldade dificuldade;

  ControlarJogo({required this.dificuldade});

  int get quantidadeVidas => _quantidadeVidas;

  void descontaVida() {
    if (_quantidadeVidas > 0) {
      _quantidadeVidas--;
    }
  }

  int calcularPontuacao(int tempoEmSegundos) {
    return (tempoEmSegundos * dificuldade.pontosPorSegundo()).round() +
        (dificuldade.pontosPorVida * _quantidadeVidas);
  }

  void gerarFase();
}
