import 'dart:io';
import 'package:flutter/cupertino.dart';

class ChangeofPage extends ChangeNotifier {
  int pageIndex = 0;
  final double size = 28;
  final double activesize = 30;
  Directory appDirectory;
  Stream<FileSystemEntity> fileStream;
  List<String> records;
  Map<int, bool> active = {
    0: false,
    1: true,
    2: true,
    3: true,
    4: true,
  };
  final Color navbackground = Color.fromRGBO(22, 22, 22, 0.94);
  final Color activeColor = Color.fromRGBO(10, 132, 225, 1);
  final Color color = Color.fromRGBO(117, 117, 117, 1);
  void kCallback(int index) {
    pageIndex = index;

    notifyListeners();
  }

  void change(int i) {
    if (active[i] == true) {
      active.update(i, (value) => false);
    }
    for (int index = 0; index < active.length; index++) {
      if (i != index) {
        active.update(index, (value) => true);
      }
    }
    notifyListeners();
  }
}
