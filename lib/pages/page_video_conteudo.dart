import 'package:digeexplore/pages/page_home.dart';
import 'package:flutter/material.dart';

class PageVideoConteudo extends StatefulWidget {
  const PageVideoConteudo({Key? key}) : super(key: key);

  @override
  State<PageVideoConteudo> createState() => _PageVideoConteudo();
}

class _PageVideoConteudo extends State<PageVideoConteudo> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Center(child: Text('Sistema Digetório')),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => PageHome()));
            },
            icon: const Icon(Icons.close),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [],
          ),
        ),
      ),
    );
  }
}
