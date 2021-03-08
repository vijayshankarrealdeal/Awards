//import 'package:firebase/firebase.dart';
import 'package:awards/app/widgits/button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:provider/provider.dart';

class MusicStream extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(13, 13, 13, 1),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Icon(
              //   LineAwesomeIcons.spotify,
              //   color: Color.fromRGBO(50, 215, 75, 1),
              //   size: MediaQuery.of(context).size.height * 0.3,
              // ),
              // ButtonsforUI(
              //   colorText: Color.fromRGBO(255, 255, 255, 1),
              //   width: MediaQuery.of(context).size.width * 0.7,
              //   title: 'Spotify',
              //   color: Color.fromRGBO(50, 215, 75, 1),
              //   callback: () => Sauth.signInWithSpotify(context),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
