import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';

class online_v extends StatelessWidget {
  AudioPlayer audioPlayer;
  double sliderAmount = 0;

  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(Colors.black);
    return Scaffold(
      appBar: AppBar(
        title: Text("Audio From Online"),
        backgroundColor: Color.fromRGBO(48, 48, 48, 0.1),
      ),
      backgroundColor: Color(0xFF2e2e2e),
      body: Container(
        // decoration: new BoxDecoration(
        //   image: new DecorationImage(
        //     image: new AssetImage("image/bgkendrick.jpg"),
        //     fit: BoxFit.cover,
        //   ),
        // ),
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 25,
              ),
              Container(
                alignment: Alignment.topLeft,
                margin: EdgeInsets.only(
                  left: 10,
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image(
                    image: new AssetImage('image/yo.jpg'),

                    // height: 100,
                    // width: 100,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Text(
                "Love.(FEAT.ZACARI.)",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                "kendrick Lamar",
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                    fontWeight: FontWeight.w600),
              ),
              Slider(
                value: sliderAmount,
                onChanged: (double delta) {
                  (() {
                    sliderAmount = delta;
                    print(sliderAmount);
                  });
                },
                min: 0,
                max: 100,
                activeColor: Colors.white,
                inactiveColor: Colors.amber,
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  IconButton(
                    iconSize: 45,
                    icon: Icon(
                      Icons.pause_circle_filled,
                      color: Colors.white,
                    ),
                    onPressed: () async {
                      await audioPlayer.pause();
                    },
                  ),
                  IconButton(
                    iconSize: 60,
                    icon: Icon(
                      Icons.play_circle_filled,
                      color: Colors.white,
                    ),
                    onPressed: () async {
                      audioPlayer = await AudioCache().play(
                          'https://github.com/naveen-18/Flutter_task1/blob/master/Kendrick%20Lamar%20-%20LOVE.%20ft.%20Zacari.mp3');
                    },
                  ),
                  IconButton(
                    iconSize: 45,
                    icon: Icon(
                      Icons.stop,
                      color: Colors.white,
                    ),
                    onPressed: () async {
                      await audioPlayer.stop();
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
