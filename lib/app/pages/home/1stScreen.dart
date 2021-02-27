import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:voiceApp/services/UserNULLORNOT.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userStauts = Provider.of<UserISAUTHORNOT>(context);
    return Container(
      color: userStauts.changeUserStatus ? Colors.blue : Colors.pink,
    );
  }
}
