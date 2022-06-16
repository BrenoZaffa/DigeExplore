import 'package:digeexplore/widgets/identifique_orgaos.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PageIdentifiqueOrgaos extends StatefulWidget {
  const PageIdentifiqueOrgaos({Key? key}) : super(key: key);

  @override
  State<PageIdentifiqueOrgaos> createState() => _PageIdentifiqueOrgaosState();
}

class _PageIdentifiqueOrgaosState extends State<PageIdentifiqueOrgaos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff073B4C),
      // appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.only(top: 32),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(35),
              topRight: Radius.circular(35),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Color(0xFFFF006D),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(35),
                    topRight: Radius.circular(35),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Text(
                    'IDENTIFIQUE OS ÓRGÃOS',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 23,
                    ),
                  ),
                ),
              ),
              const IdentiqueOrgaos(),
            ],
          ),
        ),
      ),
    );
  }
}
