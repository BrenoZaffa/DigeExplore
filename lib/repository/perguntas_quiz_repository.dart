import 'package:digeexplore/enums/enum_dificuldade.dart';

class Pergunta {
  final String pergunta;
  final List<String> alternativas;
  final String alternativaCorreta;

  Pergunta({
    required this.pergunta,
    required this.alternativas,
    required this.alternativaCorreta,
  });

  List<String> getAlternativasAleatorias(EnumDificuldade dificuldade) {
    List<String> alternativasAleatorias;

    do {
      alternativasAleatorias = alternativas.toList();

      alternativasAleatorias.shuffle();

      if (!dificuldade.isDificil) {
        alternativasAleatorias.removeLast();
      }
    } while (!alternativasAleatorias.contains(alternativaCorreta));

    return alternativasAleatorias;
  }
}

class PerguntasQuiz {
  static final perguntas = [
    Pergunta(
      pergunta: 'A digestão de alimentos começa pela ____',
      alternativas: [
        'boca',
        'estômago',
        'esôfago',
        'intestino',
      ],
      alternativaCorreta: 'boca',
    ),
    Pergunta(
      pergunta: 'No estômago o alimento se encontrará com o ____ ________',
      alternativas: [
        'suco gástrico',
        'suco de uva',
        'água',
        'coração',
      ],
      alternativaCorreta: 'suco gástrico',
    ),
    Pergunta(
      pergunta: 'A língua empurra os alimentos mastigados para o _________',
      alternativas: [
        'esôfago',
        'intestino',
        'estômago',
        'pâncreas',
      ],
      alternativaCorreta: 'esôfago',
    ),
    Pergunta(
      pergunta: 'O intestino delgado é responsável pela _______ de nutrientes',
      alternativas: [
        'absorção',
        'eliminação',
        'transformação',
        'evolução',
      ],
      alternativaCorreta: 'absorção',
    ),
    Pergunta(
      pergunta: 'No intestino grosso é absorvido toda a ____',
      alternativas: [
        'água',
        'nutrientes',
        'bolo fecal',
        'quilo',
      ],
      alternativaCorreta: 'água',
    ),
  ];
}
