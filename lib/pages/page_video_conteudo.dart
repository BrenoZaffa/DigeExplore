import 'package:digeexplore/enums/enum_dificuldade.dart';
import 'package:digeexplore/pages/page_ajuda.dart';
import 'package:digeexplore/pages/page_nome.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';

class PageVideoConteudo extends StatefulWidget {
  final String title;
  final String color;
  final String diretory;
  final String page;
  final EnumDificuldade? dificuldade;

  const PageVideoConteudo(
      {Key? key,
      required this.title,
      required this.color,
      required this.diretory,
      required this.page,
      this.dificuldade})
      : super(key: key);

  @override
  State<PageVideoConteudo> createState() => _PageVideoConteudo();
}

class _PageVideoConteudo extends State<PageVideoConteudo> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(widget.diretory)
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });

    // if (widget.page == "splash_page" ||
    //     widget.page == "page_ajuda_video_aula") {
    //   SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeRight]);
    // }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  redirect() {
    _controller.pause();
    setState(() {});
    switch (widget.page) {
      case "splash_page":
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => PageNome()));
        // Navigator.of(context).pushReplacement(
        //     MaterialPageRoute(builder: (context) => PageNome()));
        break;
      case "page_ajuda":
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => PageAjuda()));
        // Navigator.push(
        //     context, MaterialPageRoute(builder: (context) => PageAjuda()));
        break;
      case "page_ajuda_video_aula":
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => PageAjuda()));
        // Navigator.push(
        //     context, MaterialPageRoute(builder: (context) => PageAjuda()));
        break;
      case "/identifique_orgaos":
      case "/jogo_memoria":
      case "/quiz":
        Navigator.of(context).pushReplacementNamed(widget.page, arguments: {
          "dificuldade": widget.dificuldade,
        });
        break;
      default:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => PageNome()));
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(child: Text(widget.title)),
        backgroundColor: Color(int.parse(widget.color)),
        actions: [
          IconButton(
            onPressed: () {
              redirect();
            },
            icon: const Icon(Icons.close),
          ),
        ],
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: _controller.value.isInitialized
            ? AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              )
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _controller.value.isPlaying
                ? _controller.pause()
                : _controller.play();
          });
        },
        child: Icon(
          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),
    );
  }
}
