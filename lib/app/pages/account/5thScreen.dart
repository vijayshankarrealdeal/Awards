import 'package:awards/app/widgits/HeadingTitle.dart';
import 'package:awards/app/widgits/button.dart';
import 'package:awards/services/UserNULLORNOT.dart';
import 'package:awards/services/firebase_services/auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:awards/app/widgits/ring.dart';
import 'package:provider/provider.dart';

class Account extends StatelessWidget {
  void blurEveryThing(UserISAUTHORNOT cblue) {
    cblue.blurx();
  }

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<Auth>(context);
    final userCheck = Provider.of<UserISAUTHORNOT>(context);
    return Scaffold(
      appBar: userCheck.changeUserStatus
          ? headingTitle('Account')
          : headingTitle(''),
      backgroundColor: Color.fromRGBO(13, 13, 13, 1),
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
                    child: AnimatedContainer(
                      curve: Curves.easeIn,
                      duration: Duration(milliseconds: 2000),
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(255, 255, 255, 1),
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
            ButtonsforUI(
              icon: null,
              colorText: Color.fromRGBO(255, 255, 255, 1),
              width: MediaQuery.of(context).size.width * 0.7,
              title: 'Login',
              color: Color.fromRGBO(10, 132, 255, 1),
              callback: () => blurEveryThing(userCheck),
            )
          ],
        ),
      ),
    );
  }
}
