import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';

class local extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(Colors.black);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(48, 48, 48, 0.1),
        title: Text("Video From Local"),
      ),
      backgroundColor: Color(0xFF2e2e2e),
      body: ListView(
        children: [
          Column(
            children: <Widget>[
              ChewieListItem(
                videoPlayerController: VideoPlayerController.asset(
                  'assets/Video/Godzilla_eminem_juice.mp4',
                ),
                looping: true,
              ),
              ChewieListItem(
                videoPlayerController: VideoPlayerController.asset(
                  'assets/Video/kingkohli.mp4',
                ),
                looping: true,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ChewieListItem extends StatefulWidget {
  final VideoPlayerController videoPlayerController;
  final bool looping;
  ChewieListItem({
    @required this.videoPlayerController,
    this.looping,
    Key key,
  }) : super(key: key);

  @override
  _ChewieListItemState createState() => _ChewieListItemState();
}

class _ChewieListItemState extends State<ChewieListItem> {
  ChewieController _chewieController;
  @override
  void initState() {
    super.initState();
    _chewieController = ChewieController(
      videoPlayerController: widget.videoPlayerController,
      aspectRatio: 16 / 9,
      autoInitialize: true,
      looping: widget.looping,
      errorBuilder: (context, errorMessage) {
        return Center(
          child: Text(
            errorMessage,
            style: TextStyle(color: Colors.white),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Chewie(
        controller: _chewieController,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    widget.videoPlayerController.dispose();
    _chewieController.dispose();
  }
}
