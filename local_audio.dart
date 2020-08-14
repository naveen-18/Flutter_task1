import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';

typedef void OnError(Exception exception);

class LocalAudio extends StatefulWidget {
  @override
  _LocalAudio createState() => _LocalAudio();
}

class _LocalAudio extends State<LocalAudio> {
  Duration _duration = new Duration();
  Duration _position = new Duration();
  AudioPlayer advancedPlayer;
  AudioCache audioCache;

  @override
  void initState() {
    super.initState();
    initPlayer();
  }

  void initPlayer() {
    advancedPlayer = new AudioPlayer();
    audioCache = new AudioCache(fixedPlayer: advancedPlayer);

    advancedPlayer.durationHandler = (d) => setState(() {
          _duration = d;
        });

    advancedPlayer.positionHandler = (p) => setState(() {
          _position = p;
        });
  }

  String localFilePath;

  Widget _tab(List<Widget> children) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image(
              image: new AssetImage('image/emwayne.jpg'),
              // height: 150,
              // width: 150,
              fit: BoxFit.cover,
            ),
          ),
        ),
        // SizedBox(
        //   height: 5,
        // ),
        Text(
          "No Love.(feat.Lil Wayne.)",
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.w600),
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          "Eminem",
          style: TextStyle(
              fontSize: 16, color: Colors.grey, fontWeight: FontWeight.w600),
        ),
        Container(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: children
                .map((w) => Container(child: w, padding: EdgeInsets.all(6.0)))
                .toList(),
          ),
        ),
      ],
    );
  }

  Widget _btn(String txt, VoidCallback onPressed) {
    return ButtonTheme(
      minWidth: 48.0,
      child: Container(
        width: 140,
        height: 40,
        child: RaisedButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: Text(txt),
          textColor: Colors.white,
          color: Color(0xFF2e2e2e),
          elevation: 30,
          // color: Colors.lightBlue.shade300,
          // textColor: Colors.black,
          onPressed: onPressed,
        ),
      ),
    );
  }

  Widget slider() {
    return Slider(
        activeColor: Colors.white,
        inactiveColor: Colors.grey,
        value: _position.inSeconds.toDouble(),
        min: 0.0,
        max: _duration.inSeconds.toDouble(),
        onChanged: (double value) {
          setState(() {
            seekToSecond(value.toInt());
            value = value;
          });
        });
  }

  Widget LocalAudio() {
    return _tab([
      slider(),
      _btn('Play',
          () => audioCache.play('Audio/eminem-ft-lil-wayne-no-love.mp3')),
      _btn('Pause', () => advancedPlayer.pause()),
      _btn('stop', () => advancedPlayer.stop()),
    ]);
  }

  void seekToSecond(int second) {
    Duration newDuration = Duration(seconds: second);

    advancedPlayer.seek(newDuration);
  }

  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(Colors.black);
    return DefaultTabController(
      length: 1,
      child: Scaffold(
        backgroundColor: Color(0xFF2e2e2e),
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(48, 48, 48, 0.1),
          title: Text('Audio From Local'),
        ),
        body: TabBarView(
          children: [
            LocalAudio(),
          ],
        ),
      ),
    );
  }
}
