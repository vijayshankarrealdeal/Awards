import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:voiceApp/app/home/change.dart';

class MaterialBottomNavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final nav = Provider.of<ChangeofPage>(context);
    return Container(
      height: MediaQuery.of(context).size.height * 0.09,
      decoration: BoxDecoration(
        color: nav.navbackground,
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 4.0, right: 4.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
                icon: Icon(
                  CupertinoIcons.app,
                  size: nav.active[0] ? nav.size : nav.activesize,
                  color: nav.active[0] ? nav.color : nav.activeColor,
                ),
                onPressed: () {
                  nav.kCallback(0);
                  nav.change(0);
                }),
            IconButton(
                icon: Icon(
                  CupertinoIcons.search,
                  size: nav.active[1] ? nav.size : nav.activesize,
                  color: nav.active[1] ? nav.color : nav.activeColor,
                ),
                onPressed: () {
                  nav.kCallback(1);
                  nav.change(1);
                }),
            AvatarGlow(
              animate: true,
              endRadius: 20.0,
              duration: Duration(seconds: 1),
              repeatPauseDuration: Duration(milliseconds: 2000),
              repeat: true,
              glowColor: Colors.black.withOpacity(0.1),
              child: IconButton(
                  icon: Icon(
                    CupertinoIcons.mic,
                    size: nav.active[2] ? nav.size : nav.activesize,
                    color: nav.active[2] ? nav.color : nav.activeColor,
                  ),
                  onPressed: () {
                    nav.kCallback(2);
                    nav.change(2);
                  }),
            ),
            IconButton(
                icon: Icon(
                  CupertinoIcons.music_albums,
                  size: nav.active[3] ? nav.size : nav.activesize,
                  color: nav.active[3] ? nav.color : nav.activeColor,
                ),
                onPressed: () {
                  nav.kCallback(3);
                  nav.change(3);
                }),
            IconButton(
                icon: Icon(
                  CupertinoIcons.person,
                  size: nav.active[4] ? nav.size : nav.activesize,
                  color: nav.active[4] ? nav.color : nav.activeColor,
                ),
                onPressed: () {
                  nav.kCallback(4);
                  nav.change(4);
                }),
          ],
        ),
      ),
    );
  }
}
