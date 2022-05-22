import 'dart:ui';

import 'package:flutter/material.dart';

class PageHome extends StatelessWidget {
  const PageHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff073B4C),
      body: Padding(
        padding: const EdgeInsets.only(top: 100),
        child: Stack(
          children: [
            Column(
              children: [
                const Text(
                  "Vamos aprender sobre o",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                const Text(
                  "Sistema Digestório",
                  style: TextStyle(
                    fontSize: 26,
                    color: Color(0XFF06D6A0),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 100),
                  child: Container(
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50.0),
                          topRight: Radius.circular(50.0),
                        )),
                    width: 1000,
                    height: 567,
                    child: Center(
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(top: 120),
                            child: GestureDetector(
                              onTap: () {},
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
                                      "Jogar",
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
                            padding: const EdgeInsets.only(top: 30),
                            child: GestureDetector(
                              onTap: () {},
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
                                      "Ranking",
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
                            padding: const EdgeInsets.only(top: 30),
                            child: GestureDetector(
                              onTap: () {},
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
                                      "Ajuda",
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
                            padding: const EdgeInsets.only(top: 30),
                            child: GestureDetector(
                              onTap: () {},
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
                                      "Sobre",
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
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                ),
                child: Image.asset("assets/images/sistema_digestorio.png"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
