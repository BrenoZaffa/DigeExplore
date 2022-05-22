import 'package:digeexplore/pages/page_video_conteudo.dart';
import 'package:flutter/material.dart';

class PageInit extends StatelessWidget {
  const PageInit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DigeExplore',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const PageVideoConteudo(),
    );
  }
}
