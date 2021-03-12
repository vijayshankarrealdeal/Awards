import 'package:awards/app/widgits/HeadingTitle.dart';
import 'package:awards/app/widgits/button.dart';
import 'package:awards/services/UserNULLORNOT.dart';
import 'package:awards/services/firebase_services/auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:awards/app/widgits/ring.dart';
import 'package:provider/provider.dart';

class Account extends StatelessWidget {
  void showDialog(BuildContext context) {
    showGeneralDialog(
      barrierLabel: "Login",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: Duration(milliseconds: 700),
      context: context,
      pageBuilder: (_, __, ___) {
        return Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: MediaQuery.of(context).size.height * 0.3,
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                children: [
                  CupertinoTextField(),
                  CupertinoTextField(),
                ],
              ),
            ),
            margin: EdgeInsets.only(bottom: 50, left: 12, right: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        );
      },
      transitionBuilder: (_, anim, __, child) {
        return SlideTransition(
          position: Tween(begin: Offset(0, 1), end: Offset(0, 0)).animate(anim),
          child: child,
        );
      },
    );
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
              callback: () => showDialog(context),
            )
          ],
        ),
      ),
    );
  }
}
