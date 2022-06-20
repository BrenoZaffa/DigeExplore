import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class PageAjuda extends StatefulWidget {
  const PageAjuda({Key? key}) : super(key: key);

  @override
  State<PageAjuda> createState() => _PageAjudaState();
}

class _PageAjudaState extends State<PageAjuda> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff073B4C),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushNamed(context, "/home");
          },
        ),
        title: Text(
          'AJUDA',
          style: GoogleFonts.roboto(
            fontSize: 25,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color(0xFF3A86FF),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
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
                          color: Color(0xFF3A86FF),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            "VIDEO DA AULA",
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
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          children: [
                            SizedBox(
                              width: double.maxFinite,
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).pushNamed(
                                    '/video_conteudo',
                                    arguments: {
                                      'title': "SISTEMA DIGESTÓRIO",
                                      'color': "0xff073B4C",
                                      'diretory':
                                          "assets/videos/video_conteudo.mp4",
                                      'page': "page_ajuda_video_aula",
                                    },
                                  );
                                },
                                child: Text('SISTEMA DIGESTÓRIO'),
                                style: ElevatedButton.styleFrom(
                                  textStyle: const TextStyle(fontSize: 18),
                                  padding: const EdgeInsets.all(18),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  shadowColor: Colors.black,
                                  primary: Color(0xff073B4C),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            InkWell(
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
                        color: Color(0xFF3A86FF),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          "VIDEOS TUTORIAIS",
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
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          SizedBox(
                            width: double.maxFinite,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pushNamed(
                                  '/video_conteudo',
                                  arguments: {
                                    'title': "CAÇA-ORGÃO",
                                    'color': "0xffFF006D",
                                    'diretory':
                                        "assets/videos/tutorial_caca_orgao.mp4",
                                    'page': "page_ajuda",
                                  },
                                );
                              },
                              child: Text('CAÇA-ORGÃO'),
                              style: ElevatedButton.styleFrom(
                                textStyle: const TextStyle(fontSize: 18),
                                padding: const EdgeInsets.all(18),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                shadowColor: Colors.black,
                                primary: Color(0XFFFF006D),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 15, bottom: 15),
                            child: SizedBox(
                              width: double.maxFinite,
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).pushNamed(
                                    '/video_conteudo',
                                    arguments: {
                                      'title': "JOGO DA MEMÓRIA",
                                      'color': "0xffFF7D00",
                                      'diretory':
                                          "assets/videos/tutorial_memoria.mp4",
                                      'page': "page_ajuda",
                                    },
                                  );
                                },
                                child: Text('JOGO DA MEMÓRIA'),
                                style: ElevatedButton.styleFrom(
                                  textStyle: const TextStyle(fontSize: 18),
                                  padding: const EdgeInsets.all(18),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  shadowColor: Colors.black,
                                  primary: Color(0XFFFF7D00),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: double.maxFinite,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pushNamed(
                                  '/video_conteudo',
                                  arguments: {
                                    'title': "QUIZ",
                                    'color': "0xff8F00FF",
                                    'diretory':
                                        "assets/videos/tutorial_quiz.mp4",
                                    'page': "page_ajuda",
                                  },
                                );
                              },
                              child: Text('QUIZ'),
                              style: ElevatedButton.styleFrom(
                                textStyle: const TextStyle(fontSize: 18),
                                padding: const EdgeInsets.all(18),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                shadowColor: Colors.black,
                                primary: Color(0XFF8F00FF),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
