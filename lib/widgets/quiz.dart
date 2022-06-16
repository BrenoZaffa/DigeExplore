import 'package:digeexplore/class/finalizar_jogo_argument.dart';
import 'package:digeexplore/controllers/quiz_controller.dart';
import 'package:digeexplore/enums/enum_dificuldade.dart';
import 'package:digeexplore/widgets/alternativa_quiz.dart';
import 'package:digeexplore/widgets/tempo_jogo/tempo_jogo.dart';
import 'package:digeexplore/widgets/widget_cabecalho_jogo.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Quiz extends StatefulWidget {
  const Quiz({Key? key}) : super(key: key);

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  final _quizController = QuizController(EnumDificuldade.facil);
  List<String> alternativasErradas = [];
  late int tempoFinal;

  atribuirTempo(double animationValue) {
    if (animationValue == 1) {
      _quizController.finalizarFase(1);
    }

    const tempoMaximo = 120;

    tempoFinal = tempoMaximo - (animationValue * tempoMaximo).toInt();
  }

  void selecaoAlternativa(String alternativa) {
    if (_quizController.isAlternativaCorreta(alternativa)) {
      _quizController.finalizarFase(tempoFinal);
      SnackBar snackBar = const SnackBar(
        content: Text('Acertou! Parabéns!'),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      irParaPontuacaoFinal(_quizController.calcularPontuacao(tempoFinal));
    } else {
      setState(() {
        alternativasErradas.add(alternativa);
        _quizController.descontaVida();
      });
      SnackBar snackBar = const SnackBar(
        content: Text('Tente novamente!'),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  irParaPontuacaoFinal(int pontuacao) {
    Navigator.pushReplacementNamed(context, '/final_jogo',
        arguments: FinalizarJogoArgument('QUIZ', pontuacao));
  }

  Widget getAlternativa(String alternativa, String letra) {
    return !alternativasErradas.contains(alternativa) ||
            !_quizController.dificuldade.isFacil
        ? AlternativaQuiz(
            alternativa: alternativa,
            letra: letra,
            onTap: selecaoAlternativa,
          )
        : Padding(
            padding: const EdgeInsets.only(top: 6),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              width: double.infinity,
              height: 60,
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xFFDDDDDD)),
                borderRadius: const BorderRadius.all(Radius.circular(12.0)),
              ),
              child: Row(
                children: [
                  Text(
                    letra,
                    style: GoogleFonts.poppins(
                      fontSize: 25,
                      color: const Color(0xFFDDDDDD),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Text(
                      alternativa,
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        color: const Color(0xFFDDDDDD),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TempoJogo(
            onTempoTerminado: atribuirTempo,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 7),
            child: WidgetCabecalhoJogo(
              quantidadeVidas: _quizController.quantidadeVidas,
            ),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xFF8F00FF)),
                    borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                  ),
                  child: Text(
                    _quizController.pergunta.pergunta,
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      // color: Color(
                      //     _jogoMemoriaController.orgaoCorreto.getColor()),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 10,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    getAlternativa(_quizController.alternativas[0], 'A'),
                    getAlternativa(_quizController.alternativas[1], 'B'),
                    getAlternativa(_quizController.alternativas[2], 'C'),
                    if (_quizController.alternativas.length > 3)
                      getAlternativa(_quizController.alternativas[3], 'D'),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
