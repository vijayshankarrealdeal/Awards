import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AudioListenPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(13, 13, 13, 1),
      appBar: CupertinoNavigationBar(
        previousPageTitle: 'Albums',
        backgroundColor: Color.fromRGBO(22, 22, 22, 0.94),
        middle: Text(
          'Music',
          style: TextStyle(
              fontFamily: 'SF-Pro-Text-Semibold',
              fontSize: 17,
              color: Color.fromRGBO(255, 255, 255, 1)),
        ),
      ),
      body: Container(),
    );
  }
}
