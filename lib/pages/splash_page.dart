import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<void> irParaProximaPage() async {
      await Future.delayed(const Duration(seconds: 3));

      // Navigator.pushReplacementNamed(context, '/video_conteudo');
      Navigator.of(context).pushNamed(
        '/video_conteudo',
        arguments: {
          'title': "Sistema Digetório",
          'color': "0xff073B4C",
          'diretory': "assets/videos/video_conteudo.mp4",
          'page': "splash_page",
        },
      );
    }

    irParaProximaPage();

    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            color: const Color(0xff073B4C),
            // decoration: const BoxDecoration(
            //   gradient: LinearGradient(
            //     colors: [Color(0xFF28D890), Color(0xFF0EC4B7)],
            //   ),
            // ),
          ),
          SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(90),
                  child: Image.asset("assets/images/sistema_digestorio.png"),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: Text(
                    'DigExplore',
                    style: GoogleFonts.poppins(
                      fontSize: 40,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
