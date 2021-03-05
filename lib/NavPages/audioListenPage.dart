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
      body: Container(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Color.fromRGBO(13, 13, 13, 1),
                    borderRadius: BorderRadius.circular(12.0),
                    image: DecorationImage(
                      image: AssetImage(
                        'images/Cover.jpg',
                      ),
                      fit: BoxFit.cover,
                    )),
                height: MediaQuery.of(context).size.height * 0.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
