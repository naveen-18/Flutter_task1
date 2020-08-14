import 'package:flutter/material.dart';
import 'package:music_vdo/Video_page/local_video.dart';
import 'package:music_vdo/Video_page/online_video.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';

class online extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(Colors.black);
    return Scaffold(
      appBar: AppBar(
        title: Text("Video Player"),
        backgroundColor: Color.fromRGBO(48, 48, 48, 0.1),
      ),
      backgroundColor: Color(0xFF2e2e2e),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 220,
              height: 50,
              margin: const EdgeInsets.all(10.0),
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                textColor: Colors.white,
                color: Color(0xFF2e2e2e),
                child: Text(
                  'Video From Local',
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => local()),
                  );
                },
              ),
            ),
            Container(
              width: 220,
              height: 50,
              margin: const EdgeInsets.all(10.0),
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                textColor: Colors.white,
                color: Color(0xFF2e2e2e),
                child: Text(
                  'Video From Online',
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => video()),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
