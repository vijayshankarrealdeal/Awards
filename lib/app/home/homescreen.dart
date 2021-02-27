import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:voiceApp/app/home/bottomNavigationBar.dart';
import 'package:voiceApp/app/home/change.dart';
import 'package:voiceApp/app/pages/account/5thScreen.dart';
import 'package:voiceApp/app/pages/addVoice/3rdScreen.dart';
import 'package:voiceApp/app/pages/home/1stScreen.dart';
import 'package:voiceApp/app/pages/musicStream/4thScreen.dart';
import 'package:voiceApp/app/pages/search/2ndScreen.dart';

class HomeScreen extends StatelessWidget {
  final List<Widget> children = [
    Home(),
    Search(),
    // ChangeNotifierProvider<RecordVoiceOfCLient>(
    //     create: (context) => RecordVoiceOfCLient(), child: AddVoice()),
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
