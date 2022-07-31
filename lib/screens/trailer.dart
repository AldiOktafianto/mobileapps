
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class Trailer extends StatefulWidget {
  final data;
  const Trailer({Key key, this.data}) : super(key: key);

  @override
  State<Trailer> createState() => _TrailerState();
}

class _TrailerState extends State<Trailer> {
  ChewieController cw;

  @override
  void initState() {
    super.initState();
    cw = ChewieController(
        videoPlayerController: VideoPlayerController.asset(widget.data),
        aspectRatio: 16 / 9,
        autoInitialize: true,
        fullScreenByDefault: true,
        looping: false,
        autoPlay: true,
        errorBuilder: (context, errormassege) {
          return Center(
            child: Text(errormassege),
          );
        }
    );
  }
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context);
    return Scaffold(
      body: Container(
        height: media.size.height,
        width:  media.size.width,
        child: Chewie(
          controller: cw,
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    cw.videoPlayerController.dispose();
    cw.dispose();
  }
}
