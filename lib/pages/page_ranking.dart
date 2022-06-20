import 'package:digeexplore/class/partida.dart';
import 'package:digeexplore/repositories/partida_repository.dart';
import 'package:digeexplore/repositories/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PageRanking extends StatefulWidget {
  const PageRanking({Key? key}) : super(key: key);

  @override
  State<PageRanking> createState() => _PageRankingState();
}

class _PageRankingState extends State<PageRanking> {
  @override
  Widget build(BuildContext context) {
    final partidaRepository = context.watch<PartidaRepository>();
    final userRepository = context.watch<UserRepository>();
    partidaRepository.getPartidas();
    // partidaRepository.limparDados();
    Map cacaOrgaos = {
      "facil": partidaRepository.partidas
          .where((element) =>
              element['idMinigame'] == 1 && element['Dificuldade'] == 1)
          .toList(),
      "medio": partidaRepository.partidas
          .where((element) =>
              element['idMinigame'] == 1 && element['Dificuldade'] == 2)
          .toList(),
      "dificil": partidaRepository.partidas
          .where((element) =>
              element['idMinigame'] == 1 && element['Dificuldade'] == 3)
          .toList(),
    };

    Map memoria = {
      "facil": partidaRepository.partidas
          .where((element) =>
              element['idMinigame'] == 2 && element['Dificuldade'] == 1)
          .toList(),
      "medio": partidaRepository.partidas
          .where((element) =>
              element['idMinigame'] == 2 && element['Dificuldade'] == 2)
          .toList(),
      "dificil": partidaRepository.partidas
          .where((element) =>
              element['idMinigame'] == 2 && element['Dificuldade'] == 3)
          .toList(),
    };

    Map quiz = {
      "facil": partidaRepository.partidas
          .where((element) =>
              element['idMinigame'] == 3 && element['Dificuldade'] == 1)
          .toList(),
      "medio": partidaRepository.partidas
          .where((element) =>
              element['idMinigame'] == 3 && element['Dificuldade'] == 2)
          .toList(),
      "dificil": partidaRepository.partidas
          .where((element) =>
              element['idMinigame'] == 3 && element['Dificuldade'] == 3)
          .toList(),
    };

    return Scaffold(
      backgroundColor: const Color(0xff073B4C),
      appBar: AppBar(
        backgroundColor: Color(0xFF05FF69),
        title: const Text('RANKING'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pushReplacementNamed("/home"),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                userRepository.nome,
                style: GoogleFonts.poppins(
                  fontSize: 30,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20, top: 20),
                child: InkWell(
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: double.infinity,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                            color: Color(0xffFF006D),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Text(
                              "CAÇA-ORGÃOS",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black, width: 1),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  Center(
                                    child: Text(
                                      "FÁCIL",
                                      style: GoogleFonts.poppins(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "1º " +
                                            (cacaOrgaos["facil"].length > 0
                                                ? cacaOrgaos["facil"][0]
                                                        ["Pontuacao_Total"]
                                                    .toString()
                                                : "0"),
                                        style: GoogleFonts.poppins(
                                          color: Colors.black,
                                          fontSize: 20,
                                        ),
                                      ),
                                      Text(
                                        "2º " +
                                            (cacaOrgaos["facil"].length > 1
                                                ? cacaOrgaos["facil"][1]
                                                        ["Pontuacao_Total"]
                                                    .toString()
                                                : "0"),
                                        style: GoogleFonts.poppins(
                                          color: Colors.black,
                                          fontSize: 20,
                                        ),
                                      ),
                                      Text(
                                        "3º " +
                                            (cacaOrgaos["facil"].length > 2
                                                ? cacaOrgaos["facil"][2]
                                                        ["Pontuacao_Total"]
                                                    .toString()
                                                : "0"),
                                        style: GoogleFonts.poppins(
                                          color: Colors.black,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black, width: 1),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  Center(
                                    child: Text(
                                      "MÉDIO",
                                      style: GoogleFonts.poppins(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "1º " +
                                            (cacaOrgaos["medio"].length > 0
                                                ? cacaOrgaos["medio"][0]
                                                        ["Pontuacao_Total"]
                                                    .toString()
                                                : "0"),
                                        style: GoogleFonts.poppins(
                                          color: Colors.black,
                                          fontSize: 20,
                                        ),
                                      ),
                                      Text(
                                        "2º " +
                                            (cacaOrgaos["medio"].length > 1
                                                ? cacaOrgaos["medio"][1]
                                                        ["Pontuacao_Total"]
                                                    .toString()
                                                : "0"),
                                        style: GoogleFonts.poppins(
                                          color: Colors.black,
                                          fontSize: 20,
                                        ),
                                      ),
                                      Text(
                                        "3º " +
                                            (cacaOrgaos["medio"].length > 2
                                                ? cacaOrgaos["medio"][2]
                                                        ["Pontuacao_Total"]
                                                    .toString()
                                                : "0"),
                                        style: GoogleFonts.poppins(
                                          color: Colors.black,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black, width: 1),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  Center(
                                    child: Text(
                                      "DIFÍCIl",
                                      style: GoogleFonts.poppins(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "1º " +
                                            (cacaOrgaos["dificil"].length > 0
                                                ? cacaOrgaos["dificil"][0]
                                                        ["Pontuacao_Total"]
                                                    .toString()
                                                : "0"),
                                        style: GoogleFonts.poppins(
                                          color: Colors.black,
                                          fontSize: 20,
                                        ),
                                      ),
                                      Text(
                                        "2º " +
                                            (cacaOrgaos["dificil"].length > 1
                                                ? cacaOrgaos["dificil"][1]
                                                        ["Pontuacao_Total"]
                                                    .toString()
                                                : "0"),
                                        style: GoogleFonts.poppins(
                                          color: Colors.black,
                                          fontSize: 20,
                                        ),
                                      ),
                                      Text(
                                        "3º " +
                                            (cacaOrgaos["dificil"].length > 2
                                                ? cacaOrgaos["dificil"][2]
                                                        ["Pontuacao_Total"]
                                                    .toString()
                                                : "0"),
                                        style: GoogleFonts.poppins(
                                          color: Colors.black,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: InkWell(
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: double.infinity,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                            color: Color(0xffFF7D00),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Text(
                              "JOGO DA MEMÓRIA",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black, width: 1),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  Center(
                                    child: Text(
                                      "FÁCIL",
                                      style: GoogleFonts.poppins(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "1º " +
                                            (memoria["facil"].length > 0
                                                ? memoria["facil"][0]
                                                        ["Pontuacao_Total"]
                                                    .toString()
                                                : "0"),
                                        style: GoogleFonts.poppins(
                                          color: Colors.black,
                                          fontSize: 20,
                                        ),
                                      ),
                                      Text(
                                        "2º " +
                                            (memoria["facil"].length > 1
                                                ? memoria["facil"][1]
                                                        ["Pontuacao_Total"]
                                                    .toString()
                                                : "0"),
                                        style: GoogleFonts.poppins(
                                          color: Colors.black,
                                          fontSize: 20,
                                        ),
                                      ),
                                      Text(
                                        "3º " +
                                            (memoria["facil"].length > 2
                                                ? memoria["facil"][2]
                                                        ["Pontuacao_Total"]
                                                    .toString()
                                                : "0"),
                                        style: GoogleFonts.poppins(
                                          color: Colors.black,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black, width: 1),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  Center(
                                    child: Text(
                                      "MÉDIO",
                                      style: GoogleFonts.poppins(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "1º " +
                                            (memoria["medio"].length > 0
                                                ? memoria["medio"][0]
                                                        ["Pontuacao_Total"]
                                                    .toString()
                                                : "0"),
                                        style: GoogleFonts.poppins(
                                          color: Colors.black,
                                          fontSize: 20,
                                        ),
                                      ),
                                      Text(
                                        "2º " +
                                            (memoria["medio"].length > 1
                                                ? memoria["medio"][1]
                                                        ["Pontuacao_Total"]
                                                    .toString()
                                                : "0"),
                                        style: GoogleFonts.poppins(
                                          color: Colors.black,
                                          fontSize: 20,
                                        ),
                                      ),
                                      Text(
                                        "3º " +
                                            (memoria["medio"].length > 2
                                                ? memoria["medio"][2]
                                                        ["Pontuacao_Total"]
                                                    .toString()
                                                : "0"),
                                        style: GoogleFonts.poppins(
                                          color: Colors.black,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black, width: 1),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  Center(
                                    child: Text(
                                      "DIFÍCIl",
                                      style: GoogleFonts.poppins(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "1º " +
                                            (memoria["dificil"].length > 0
                                                ? memoria["dificil"][0]
                                                        ["Pontuacao_Total"]
                                                    .toString()
                                                : "0"),
                                        style: GoogleFonts.poppins(
                                          color: Colors.black,
                                          fontSize: 20,
                                        ),
                                      ),
                                      Text(
                                        "2º " +
                                            (memoria["dificil"].length > 1
                                                ? memoria["dificil"][1]
                                                        ["Pontuacao_Total"]
                                                    .toString()
                                                : "0"),
                                        style: GoogleFonts.poppins(
                                          color: Colors.black,
                                          fontSize: 20,
                                        ),
                                      ),
                                      Text(
                                        "3º " +
                                            (memoria["dificil"].length > 2
                                                ? memoria["dificil"][2]
                                                        ["Pontuacao_Total"]
                                                    .toString()
                                                : "0"),
                                        style: GoogleFonts.poppins(
                                          color: Colors.black,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: InkWell(
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: double.infinity,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                            color: Color(0xff8F00FF),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Text(
                              "QUIZ",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black, width: 1),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  Center(
                                    child: Text(
                                      "FÁCIL",
                                      style: GoogleFonts.poppins(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "1º " +
                                            (quiz["facil"].length > 0
                                                ? quiz["facil"][0]
                                                        ["Pontuacao_Total"]
                                                    .toString()
                                                : "0"),
                                        style: GoogleFonts.poppins(
                                          color: Colors.black,
                                          fontSize: 20,
                                        ),
                                      ),
                                      Text(
                                        "2º " +
                                            (quiz["facil"].length > 1
                                                ? quiz["facil"][1]
                                                        ["Pontuacao_Total"]
                                                    .toString()
                                                : "0"),
                                        style: GoogleFonts.poppins(
                                          color: Colors.black,
                                          fontSize: 20,
                                        ),
                                      ),
                                      Text(
                                        "3º " +
                                            (quiz["facil"].length > 2
                                                ? quiz["facil"][2]
                                                        ["Pontuacao_Total"]
                                                    .toString()
                                                : "0"),
                                        style: GoogleFonts.poppins(
                                          color: Colors.black,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black, width: 1),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  Center(
                                    child: Text(
                                      "MÉDIO",
                                      style: GoogleFonts.poppins(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "1º " +
                                            (quiz["medio"].length > 0
                                                ? quiz["medio"][0]
                                                        ["Pontuacao_Total"]
                                                    .toString()
                                                : "0"),
                                        style: GoogleFonts.poppins(
                                          color: Colors.black,
                                          fontSize: 20,
                                        ),
                                      ),
                                      Text(
                                        "2º " +
                                            (quiz["medio"].length > 1
                                                ? quiz["medio"][1]
                                                        ["Pontuacao_Total"]
                                                    .toString()
                                                : "0"),
                                        style: GoogleFonts.poppins(
                                          color: Colors.black,
                                          fontSize: 20,
                                        ),
                                      ),
                                      Text(
                                        "3º " +
                                            (quiz["medio"].length > 2
                                                ? quiz["medio"][2]
                                                        ["Pontuacao_Total"]
                                                    .toString()
                                                : "0"),
                                        style: GoogleFonts.poppins(
                                          color: Colors.black,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black, width: 1),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  Center(
                                    child: Text(
                                      "DIFÍCIl",
                                      style: GoogleFonts.poppins(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "1º " +
                                            (quiz["dificil"].length > 0
                                                ? quiz["dificil"][0]
                                                        ["Pontuacao_Total"]
                                                    .toString()
                                                : "0"),
                                        style: GoogleFonts.poppins(
                                          color: Colors.black,
                                          fontSize: 20,
                                        ),
                                      ),
                                      Text(
                                        "2º " +
                                            (quiz["dificil"].length > 1
                                                ? quiz["dificil"][1]
                                                        ["Pontuacao_Total"]
                                                    .toString()
                                                : "0"),
                                        style: GoogleFonts.poppins(
                                          color: Colors.black,
                                          fontSize: 20,
                                        ),
                                      ),
                                      Text(
                                        "3º " +
                                            (quiz["dificil"].length > 2
                                                ? quiz["dificil"][2]
                                                        ["Pontuacao_Total"]
                                                    .toString()
                                                : "0"),
                                        style: GoogleFonts.poppins(
                                          color: Colors.black,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
