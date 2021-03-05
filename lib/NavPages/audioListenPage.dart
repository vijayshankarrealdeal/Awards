import 'package:awards/app/widgits/button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class AudioListenPage extends StatefulWidget {
  @override
  _AudioListenPageState createState() => _AudioListenPageState();
}

class _AudioListenPageState extends State<AudioListenPage> {
  final List<String> images = ['images/Cover.jpg'];
  List<PaletteColor> colors;
  int _currentIndex = 0;
  @override
  void initState() {
    colors = [];
    _updatePallet();
    super.initState();
  }

  _updatePallet() async {
    for (String image in images) {
      final PaletteGenerator generator =
          await PaletteGenerator.fromImageProvider(AssetImage(image),
              size: Size(200, 200));
      colors.add(generator.lightMutedColor != null
          ? generator.lightMutedColor
          : PaletteColor(Color.fromRGBO(13, 13, 13, 1), 2));
    }
    setState(() {});
  }

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
                        fontFamily: 'SF-Pro-Display-Regular',
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
                        fontFamily: 'SF-Pro-Display-Regular',
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
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
                      SizedBox(
                          width: MediaQuery.of(context).size.height * 0.03),
                      Text(
                        'A Moment Apart',
                        style: TextStyle(
                          color: Color.fromRGBO(255, 255, 255, 1),
                          fontFamily: 'SF-Pro-Display-Regular',
                          fontSize: 17,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(
                          CupertinoIcons.play_arrow_solid,
                          color: Color.fromRGBO(255, 255, 255, 1),
                          size: 28,
                        ),
                        onPressed: () => print(''),
                      ),
                      IconButton(
                        icon: Icon(
                          CupertinoIcons.forward_fill,
                          color: Color.fromRGBO(255, 255, 255, 1),
                          size: 28,
                        ),
                        onPressed: () => print(''),
                      ),
                    ],
                  )
                ],
              ),
              minHeight: MediaQuery.of(context).size.height * 0.08,
              maxHeight: MediaQuery.of(context).size.height * 0.89,
              color: colors.isNotEmpty
                  ? colors[_currentIndex].color
                  : Color.fromRGBO(13, 13, 13, 1),
              panel: Container(
                // decoration: BoxDecoration(
                //     gradient: LinearGradient(colors: [

                //   Colors.blue,
                //   Colors.blueAccent,
                //   Colors.purple,
                // ])),
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    Icon(
                      CupertinoIcons.minus,
                      size: 56,
                      color: Color.fromRGBO(10, 132, 255, 1),
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
                      padding: const EdgeInsets.only(
                          left: 18.0, right: 18.0, top: 12, bottom: 22),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'A Moment Apart',
                            style: TextStyle(
                              color: Color.fromRGBO(255, 255, 255, 1),
                              fontFamily: 'SF-Pro-Text-Semibold',
                              fontSize: 32,
                            ),
                          ),
                          IconButton(
                            icon: Icon(
                              CupertinoIcons.arrow_2_circlepath,
                              color: Colors.white,
                            ),
                            onPressed: () => print(1),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(17.0),
                      child: Container(
                        width: double.infinity,
                        child: CupertinoSlider(
                            activeColor: Color.fromRGBO(10, 132, 255, 1),
                            value: 0.0,
                            onChanged: (onChanged) {
                              onChanged = 2;
                            }),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 18.0, right: 18.0, top: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          IconButton(
                            icon: Icon(
                              CupertinoIcons.backward_fill,
                              color: Colors.white,
                              size: 35,
                            ),
                            onPressed: () => print(1),
                          ),
                          IconButton(
                            icon: Icon(
                              CupertinoIcons.play_arrow_solid,
                              color: Colors.white,
                              size: 35,
                            ),
                            onPressed: () => print(1),
                          ),
                          IconButton(
                            icon: Icon(
                              CupertinoIcons.forward_fill,
                              color: Colors.white,
                              size: 35,
                            ),
                            onPressed: () => print(1),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 18.0, right: 18.0, top: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          IconButton(
                            icon: Icon(
                              CupertinoIcons.volume_down,
                              color: Colors.white,
                              size: 15,
                            ),
                            onPressed: () => print(1),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.66,
                            child: CupertinoSlider(
                                value: 0,
                                onChanged: (onChanged) {
                                  print(onChanged);
                                }),
                          ),
                          IconButton(
                            icon: Icon(
                              CupertinoIcons.volume_up,
                              color: Colors.white,
                              size: 15,
                            ),
                            onPressed: () => print(1),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
