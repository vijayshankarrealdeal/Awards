import 'package:flutter/material.dart';

AppBar headingTitle(String title) {
  return AppBar(
    backgroundColor: Color.fromRGBO(13, 13, 13, 1),
    elevation: 0,
    title: Text(
      title,
      style: TextStyle(
        fontFamily: 'SF-Pro-Text-Semibold',
        color: Color.fromRGBO(255, 255, 255, 1),
        fontSize: 32,
      ),
    ),
  );
}
