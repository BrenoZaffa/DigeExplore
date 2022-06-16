import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum EnumOrgaosIdentificar { boca, estomago, figado, intestinos, esofago }

extension ExtensionEnumOrgaosIdentificar on EnumOrgaosIdentificar {
  String getAsset() {
    switch (this) {
      case EnumOrgaosIdentificar.boca:
        return 'assets/images/sistemaDigestorioDemarcadoBoca.png';
      case EnumOrgaosIdentificar.estomago:
        return 'assets/images/sistemaDigestorioDemarcadoEstomago.png';
      case EnumOrgaosIdentificar.figado:
        return 'assets/images/sistemaDigestorioDemarcadoFigado.png';
      case EnumOrgaosIdentificar.intestinos:
        return 'assets/images/sistemaDigestorioDemarcadoIntestinos.png';
      case EnumOrgaosIdentificar.esofago:
        return 'assets/images/sistemaDigestorioDemarcadoEsofago.png';
    }
  }

  get name {
    switch (this) {
      case EnumOrgaosIdentificar.boca:
        return 'BOCA';
      case EnumOrgaosIdentificar.estomago:
        return 'ESTÔMAGO';
      case EnumOrgaosIdentificar.figado:
        return 'FÍGADO';
      case EnumOrgaosIdentificar.intestinos:
        return 'INSTESTINOS';
      case EnumOrgaosIdentificar.esofago:
        return 'ESÔFAGO';
    }
  }

  int getColor() {
    switch (this) {
      case EnumOrgaosIdentificar.boca:
        return 0xFFff006d;
      case EnumOrgaosIdentificar.estomago:
        return 0xFFff7d00;
      case EnumOrgaosIdentificar.figado:
        return 0xFF05ff69;
      case EnumOrgaosIdentificar.intestinos:
        return 0xFF3A86FF;
      case EnumOrgaosIdentificar.esofago:
        return 0xFF8f00ff;
    }
  }

  IconData getIcon() {
    switch (this) {
      case EnumOrgaosIdentificar.boca:
        return FontAwesomeIcons.play;
      case EnumOrgaosIdentificar.estomago:
        return FontAwesomeIcons.solidCircle;
      case EnumOrgaosIdentificar.figado:
        return FontAwesomeIcons.diamond;
      case EnumOrgaosIdentificar.intestinos:
        return FontAwesomeIcons.solidStar;
      case EnumOrgaosIdentificar.esofago:
        return FontAwesomeIcons.solidSquare;
    }
  }
}
