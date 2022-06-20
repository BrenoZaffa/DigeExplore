import 'package:flutter/material.dart';

class PageHome extends StatelessWidget {
  const PageHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    irParaMinigames() {
      Navigator.pushNamed(context, '/minigames');
    }

    irParaSobre() {
      Navigator.pushNamed(context, '/sobre');
    }

    irParaAjuda() {
      Navigator.pushNamed(context, '/ajuda');
    }

    irParaRanking() {
      Navigator.pushNamed(context, '/ranking');
    }

    return Scaffold(
      backgroundColor: const Color(0xff073B4C),
      body: Padding(
        padding: const EdgeInsets.only(top: 60),
        child: Stack(
          children: [
            Column(
              children: [
                const Text(
                  "VAMOS APRENDER SOBRE O",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                const Text(
                  "SISTEMA DIGESTÓRIO",
                  style: TextStyle(
                    fontSize: 26,
                    color: Color(0XFF06D6A0),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 70),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.69,
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(50))),
                    // width: 600,
                    // height: 567,
                    child: Center(
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(top: 120),
                            child: GestureDetector(
                              onTap: irParaMinigames,
                              child: Container(
                                width: 300,
                                height: 80,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Color(0xFFEF476F)),
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12.0)),
                                ),
                                child: const Center(
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 12, horizontal: 2),
                                    child: Text(
                                      "JOGAR",
                                      style: TextStyle(
                                        color: Color(0xFFEF476F),
                                        fontSize: 20,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: GestureDetector(
                              onTap: irParaRanking,
                              child: Container(
                                width: 300,
                                height: 80,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Color(0xFF05FF69)),
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12.0)),
                                ),
                                child: const Center(
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 12, horizontal: 2),
                                    child: Text(
                                      "RANKING",
                                      style: TextStyle(
                                        color: Color(0xFF05FF69),
                                        fontSize: 20,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: GestureDetector(
                              onTap: irParaAjuda,
                              child: Container(
                                width: 300,
                                height: 80,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Color(0xFF3A86FF)),
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12.0)),
                                ),
                                child: const Center(
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 12, horizontal: 2),
                                    child: Text(
                                      "AJUDA",
                                      style: TextStyle(
                                        color: Color(0xFF3A86FF),
                                        fontSize: 20,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: GestureDetector(
                              onTap: irParaSobre,
                              child: Container(
                                width: 300,
                                height: 80,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Color(0xFF8F00FF)),
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12.0)),
                                ),
                                child: const Center(
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 12, horizontal: 2),
                                    child: Text(
                                      "SOBRE",
                                      style: TextStyle(
                                        color: Color(0xFF8F00FF),
                                        fontSize: 20,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                  ),
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
            Padding(
              padding: const EdgeInsets.only(top: 83, left: 125),
              child: Container(
                width: 150,
                height: 150,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.asset("assets/images/sistema_digestorio.png"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
