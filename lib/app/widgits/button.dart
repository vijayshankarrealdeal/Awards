import 'package:flutter/material.dart';

class ButtonsforUI extends StatelessWidget {
  final String title;
  final Color color;
  final VoidCallback callback;
  final double width;
  final Color colorText;
  final double radius;
  final String fontFamily;
  final IconData icon;

  const ButtonsforUI(
      {@required this.width,
      this.fontFamily = 'SF-Pro-Text-Semibold',
      @required this.colorText,
      this.radius = 8.0,
      this.title,
      this.icon,
      this.color,
      this.callback});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.065,
        width: width,
        child: Center(
          child: icon == null
              ? Text(
                  title,
                  style: TextStyle(
                      fontFamily: fontFamily, fontSize: 17, color: colorText),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      icon,
                      color: colorText,
                      size: 20,
                    ),
                    SizedBox(width: 10),
                    Text(
                      title,
                      style: TextStyle(
                          fontFamily: fontFamily,
                          fontSize: 17,
                          color: colorText),
                    ),
                  ],
                ),
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius), color: color),
      ),
    );
  }
}
