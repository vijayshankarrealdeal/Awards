import 'package:flutter/cupertino.dart';

class Account extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(0, 0, 0, 1),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: double.infinity,
          ),
          Center(
            child: SizedBox(
              height: 200,
              width: 200,
              // child: CustomPaint(
              //   painter: Ring(),
              // ),
            ),
          ),
        ],
      ),
    );
  }
}
