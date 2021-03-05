import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:awards/app/widgits/ring.dart';

class Account extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(0, 0, 0, 1),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            Container(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  ClipPath(
                    clipper: Ring(
                      x: MediaQuery.of(context).size.height * 0.48,
                      y: MediaQuery.of(context).size.height * 0.48,
                      w: MediaQuery.of(context).size.height * 0.006,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        //color: Color.fromRGBO(255, 255, 255, 1),
                        gradient: LinearGradient(colors: [
                          CupertinoColors.activeBlue,
                          CupertinoColors.systemPurple,
                          CupertinoColors.systemPink,
                        ]),
                      ),
                      height: MediaQuery.of(context).size.height * 0.48,
                      width: MediaQuery.of(context).size.height * 0.48,
                    ),
                  ),
                  Text(
                    'Awards',
                    style: TextStyle(
                        fontFamily: 'SF-Pro-Display-Bold',
                        color: Color.fromRGBO(255, 255, 255, 1),
                        fontSize: MediaQuery.of(context).size.height * 0.12),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            CupertinoButton.filled(
              child: Text('Login'),
              onPressed: () => print(1),
            )
          ],
        ),
      ),
    );
  }
}
