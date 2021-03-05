import 'package:flutter/material.dart';

class ButtonsforUI extends StatelessWidget {
  final String title;
  final Color color;
  final VoidCallback callback;

  const ButtonsforUI({Key key, this.title, this.color, this.callback})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.07,
        width: MediaQuery.of(context).size.width * 0.7,
        child: Center(
          child: Text(
            title,
            style: TextStyle(
                fontFamily: 'SF-Pro-Text-Semibold',
                fontSize: 17,
                color: Color.fromRGBO(255, 255, 255, 1)),
          ),
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0), color: color),
      ),
    );
  }
}
