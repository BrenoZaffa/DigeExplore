import 'dart:math';

import 'package:digeexplore/enums/enum_orgaos.dart';

class JogoMemoriaController {
  late EnumOrgaos _orgaoCorreto;
  late List<EnumOrgaos> _orgaos;

  JogoMemoriaController() {
    _orgaoCorreto =
        EnumOrgaos.values[Random().nextInt(EnumOrgaos.values.length)];
    _orgaos = getOrgaosRandomicos();
  }

  EnumOrgaos get orgaoCorreto => _orgaoCorreto;

  List<EnumOrgaos> get orgaos => _orgaos;

  List<EnumOrgaos> getOrgaosRandomicos() {
    List<EnumOrgaos> orgaos = EnumOrgaos.values.toList();

    do {
      orgaos.removeLast();
      orgaos.shuffle();
    } while (!orgaos.contains(_orgaoCorreto));

    return orgaos;
  }

  reset() {
    _orgaoCorreto =
        EnumOrgaos.values[Random().nextInt(EnumOrgaos.values.length - 1)];
    _orgaos = getOrgaosRandomicos();
  }
}
