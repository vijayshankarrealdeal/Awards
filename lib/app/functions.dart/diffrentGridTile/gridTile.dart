import 'package:flutter/cupertino.dart';

class GridTileManagerChanger extends ChangeNotifier {
  double scaleNormal = 150;
  double upScale = 450;
  double dowmSacle = 50;
  void scaleStart(ScaleStartDetails details) {
    scaleNormal = upScale;

    notifyListeners();
  }

  void scaleUpdate(ScaleUpdateDetails details) {
    scaleNormal = upScale;
    notifyListeners();
  }

  void scaleEnd(ScaleEndDetails details) {
    scaleNormal = dowmSacle;
    notifyListeners();
  }
}
