import 'package:digeexplore/pages/page_nome.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class PageVideoConteudo extends StatefulWidget {
  final String title;
  final String color;
  final String diretory;
  final String page;

  const PageVideoConteudo(
      {Key? key,
      required this.title,
      required this.color,
      required this.diretory,
      required this.page})
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
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  redirect() {
    if (widget.page == "splash_page") {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => PageNome()));
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
        height: MediaQuery.of(context).size.height,
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
