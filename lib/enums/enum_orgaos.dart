enum EnumOrgaos { boca, estomago, figado, intestinos, pancreas }

extension EnumOrgaosExtension on EnumOrgaos {
  String getAsset() {
    switch (this) {
      case EnumOrgaos.boca:
        return 'assets/images/boca.png';
      case EnumOrgaos.estomago:
        return 'assets/images/estomago.png';
      case EnumOrgaos.figado:
        return 'assets/images/figado.png';
      case EnumOrgaos.intestinos:
        return 'assets/images/intestinos.png';
      case EnumOrgaos.pancreas:
        return 'assets/images/pancreas.png';
    }
  }

  String get name {
    switch (this) {
      case EnumOrgaos.boca:
        return 'A BOCA';
      case EnumOrgaos.estomago:
        return 'O ESTÔMAGO';
      case EnumOrgaos.figado:
        return 'O FÍGADO';
      case EnumOrgaos.intestinos:
        return 'OS INSTESTINOS';
      case EnumOrgaos.pancreas:
        return 'O PÂNCREAS';
    }
  }

  int getColor() {
    switch (this) {
      case EnumOrgaos.boca:
        return 0xFFffbe0b;
      case EnumOrgaos.estomago:
        return 0xFFFF006D;
      case EnumOrgaos.figado:
        return 0xFF8F00FF;
      case EnumOrgaos.intestinos:
        return 0xFF3A86FF;
      case EnumOrgaos.pancreas:
        return 0xFFFF7D00;
    }
  }
}
