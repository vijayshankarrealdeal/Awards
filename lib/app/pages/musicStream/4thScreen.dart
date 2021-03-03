//import 'package:firebase/firebase.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
//import 'package:provider/provider.dart';

class MusicStream extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   // final auth = Provider.of<Auth>(context);
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                LineAwesomeIcons.spotify,
                size: MediaQuery.of(context).size.height * 0.3,
              ),
              CupertinoButton(
                color: CupertinoColors.activeGreen,
                child: Text('Spotify'),
                onPressed: () => print(''),
                //auth.loginSpotifyUser(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
