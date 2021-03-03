import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:awards/app/functions.dart/diffrentGridTile/gridTile.dart';
import 'package:awards/app/home/bottomNavigationBar.dart';
import 'package:awards/app/home/change.dart';
import 'package:awards/app/pages/account/5thScreen.dart';
import 'package:awards/app/pages/addVoice/3rdScreen.dart';
import 'package:awards/app/pages/home/1stScreen.dart';
import 'package:awards/app/pages/musicStream/4thScreen.dart';
import 'package:awards/app/pages/search/2ndScreen.dart';

class HomeScreen extends StatelessWidget {
  final List<Widget> children = [
    ChangeNotifierProvider<GridTileManagerChanger>(
        create: (context) => GridTileManagerChanger(), child: Home()),
    Search(),
    AddVoice(),
    MusicStream(),
    Account(),
  ];

  @override
  Widget build(BuildContext context) {
    final nav = Provider.of<ChangeofPage>(context);
    return Scaffold(
      body: children[nav.pageIndex],
      bottomNavigationBar: MaterialBottomNavigationBar(),
    );
  }
}
