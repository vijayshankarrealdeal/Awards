import 'package:flutter/cupertino.dart';

class Ring extends CustomPainter {
  final _paint = Paint()
    ..color = Color.fromRGBO(255, 255, 255, 1)
    ..strokeWidth = 2;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawArc(Rect.fromCenter(center: 20.,_paint));
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
