import 'package:flutter/material.dart';
import 'local_audio.dart';
import 'online_audio.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';

class local_v extends StatelessWidget {
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
            Container(
              width: 220,
              height: 50,
              margin: const EdgeInsets.all(15.0),
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                textColor: Colors.white,
                color: Color(0xFF2e2e2e),
                child: Text(
                  'Audio From Local',
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LocalAudio()),
                  );
                },
              ),
            ),
            Container(
              width: 220,
              height: 50,
              margin: const EdgeInsets.all(20.0),
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                textColor: Colors.white,
                color: Color(0xFF2e2e2e),
                child: Text(
                  'Audio From Online',
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => online_v()),
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
