import 'dart:math';

import 'package:digeexplore/class/controlar_jogo.dart';
import 'package:digeexplore/enums/enum_dificuldade.dart';
import 'package:digeexplore/repository/perguntas_quiz_repository.dart';

class QuizController extends ControlarJogo {
  late Pergunta _pergunta;
  late List<String> _alternativas;

  QuizController(EnumDificuldade dificuldade) : super(dificuldade);

  Pergunta get pergunta => _pergunta;

  List<String> get alternativas => _alternativas;

  bool isAlternativaCorreta(String alternativa) {
    return _pergunta.alternativaCorreta == alternativa;
  }

  @override
  void gerarFase() {
    _pergunta = PerguntasQuiz.perguntas
        .elementAt(Random().nextInt(PerguntasQuiz.perguntas.length));

    _alternativas = _pergunta.getAlternativasAleatorias(dificuldade);
  }

  @override
  void finalizarFase(int tempoEmSegundos) {
    // TODO: implement finalizarFase
  }
}
