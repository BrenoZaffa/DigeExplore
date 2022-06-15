enum EnumDificuldade {
  facil,
  medio,
  dificil,
}

extension EnumDificuldadeExtension on EnumDificuldade {
  int tempoBaseParaConclusao() {
    switch (this) {
      case EnumDificuldade.facil:
        return 80;
      case EnumDificuldade.medio:
        return 90;
      case EnumDificuldade.dificil:
        return 100;
    }
  }

  int get pontosPorVida => 2000;

  double pontosPorSegundo() {
    switch (this) {
      case EnumDificuldade.facil:
        return 75;
      case EnumDificuldade.medio:
        return 66.67;
      case EnumDificuldade.dificil:
        return 60;
    }
  }

  int quantidadesOpcoesEscolha() {
    switch (this) {
      case EnumDificuldade.facil:
        return 3;
      case EnumDificuldade.medio:
        return 3;
      case EnumDificuldade.dificil:
        return 4;
    }
  }

  bool get isFacil => this == EnumDificuldade.facil;

  bool get isDificil => this == EnumDificuldade.dificil;
}
