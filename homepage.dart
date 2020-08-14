import 'package:flutter/material.dart';
import '../Audio_Page/audio_player.dart';
import '../Video_page/video.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';

class home_page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(Colors.black);
    return Scaffold(
      appBar: AppBar(
        title: Text('MUSIC PLAYER'),
        backgroundColor: Color.fromRGBO(48, 48, 48, 0.1),
      ),
      backgroundColor: Color(0xFF2e2e2e),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.music_note,
              color: Colors.white,
              size: 50,
            ),
            Container(
              width: 200,
              height: 50,
              margin: const EdgeInsets.all(15.0),
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                //  padding: const EdgeInsets.all(15.0),
                textColor: Colors.white,
                color: Color(0xFF2e2e2e),
                elevation: 30,
                child: Text(
                  'Play Audio',
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => local_v()),
                  );
                },
              ),
            ),
            Icon(
              Icons.ondemand_video,
              size: 50,
              color: Colors.white,
            ),
            Container(
              width: 200,
              height: 50,
              margin: const EdgeInsets.all(10.0),
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                textColor: Colors.white,
                color: Color(0xFF2e2e2e),
                elevation: 30,
                child: Text(
                  'Play Video',
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => online()),
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
