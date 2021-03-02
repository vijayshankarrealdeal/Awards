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
            child: Text(
              'Awards',
              style: TextStyle(
                  fontFamily: 'SF-Pro-Display-Bold',
                  color: Color.fromRGBO(255, 255, 255, 1),
                  fontSize: MediaQuery.of(context).size.height * 0.1),
            ),
          ),
        ],
      ),
    );
  }
}
