import 'package:awards/app/widgits/button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class AudioListenPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(13, 13, 13, 1),
      appBar: CupertinoNavigationBar(
        previousPageTitle: 'Albums',
        backgroundColor: Color.fromRGBO(22, 22, 22, 0.94),
        middle: Text(
          'Music',
          style: TextStyle(
              fontFamily: 'SF-Pro-Text-Semibold',
              fontSize: 17,
              color: Color.fromRGBO(255, 255, 255, 1)),
        ),
      ),
      body: Container(
        child: Stack(
          children: [
            Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(13, 13, 13, 1),
                        borderRadius: BorderRadius.circular(12.0),
                        image: DecorationImage(
                          image: AssetImage(
                            'images/Cover.jpg',
                          ),
                          fit: BoxFit.cover,
                        )),
                    height: MediaQuery.of(context).size.height * 0.4,
                    width: MediaQuery.of(context).size.width * 0.8,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ButtonsforUI(
                        icon: CupertinoIcons.play_arrow_solid,
                        fontFamily: 'SF-Pro-Text-Regular',
                        colorText: Color.fromRGBO(255, 69, 58, 1),
                        radius: 12.0,
                        color: Color.fromRGBO(28, 28, 30, 1),
                        width: MediaQuery.of(context).size.width * 0.42,
                        title: 'Play',
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.07,
                      ),
                      ButtonsforUI(
                        icon: CupertinoIcons.shuffle,
                        fontFamily: 'SF-Pro-Text-Regular',
                        colorText: Color.fromRGBO(255, 69, 58, 1),
                        radius: 12.0,
                        color: Color.fromRGBO(28, 28, 30, 1),
                        width: MediaQuery.of(context).size.width * 0.42,
                        title: 'Shuffle',
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(itemBuilder: (context, i) {
                    return Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                              width: 1.0, color: Color.fromRGBO(44, 44, 46, 1)),
                        ),
                        color: Color.fromRGBO(28, 28, 30, 1),
                      ),
                      height: MediaQuery.of(context).size.height * 0.055,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.ac_unit),
                                Text(
                                  'Songs',
                                  style: TextStyle(
                                    decoration: TextDecoration.none,
                                    color: Color.fromRGBO(255, 255, 255, 1),
                                    fontSize: 17.0,
                                    fontFamily: 'SF-Pro-Text-Regular',
                                  ),
                                ),
                              ],
                            ),
                            // Icon(
                            //   CupertinoIcons.chevron_forward,
                            //   color: Color.fromRGBO(60, 60, 67, 0.30),
                            //   size: 16.0,
                            // ),
                          ],
                        ),
                      ),
                    );
                  }),
                )
              ],
            ),
            SlidingUpPanel(
              collapsed: Row(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.14,
                    width: MediaQuery.of(context).size.width * 0.14,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                        image: AssetImage('images/Cover.jpg'),
                      ),
                    ),
                  ),
                ],
              ),
              minHeight: MediaQuery.of(context).size.height * 0.08,
              maxHeight: MediaQuery.of(context).size.height * 0.7,
              color: Color.fromRGBO(28, 28, 30, 1),
              panel: Center(
                child: Text("This is the sliding Widget"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
