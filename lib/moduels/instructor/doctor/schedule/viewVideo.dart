import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class PlayVideo extends StatefulWidget {

  String? link;
  PlayVideo({
    this.link,

  });
  @override
  State<PlayVideo> createState() => _PlayVideoState();
}

class _PlayVideoState extends State<PlayVideo> {
  @override
  VideoPlayerController? _controller;
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network("https://lmsprov1.herokuapp.com${widget.link}")
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: const Color(0xff030629),
      appBar: AppBar(
        backgroundColor: const Color(0xff030629),
        title: Text(" Play Video  ",style: TextStyle(color: Colors.white),),
      ),
        body: Center(
          child: _controller!.value.isInitialized?
          AspectRatio(
            aspectRatio: _controller!.value.aspectRatio,
            child: VideoPlayer(_controller!),
          )
              : Container(),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              _controller!.value.isPlaying
                  ? _controller!.pause()
                  : _controller!.play();
            });
          },
          child: Icon(
            _controller!.value.isPlaying ? Icons.pause : Icons.play_arrow,
          ),
        ),
      );
  }

  @override
  void dispose() {
    super.dispose();
    _controller!.dispose();
  }
}

