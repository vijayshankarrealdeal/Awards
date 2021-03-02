import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:voiceApp/app/functions.dart/diffrentGridTile/gridTile.dart';
import 'package:voiceApp/services/UserNULLORNOT.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final changeGrid = Provider.of<GridTileManagerChanger>(context);
    final userStauts = Provider.of<UserISAUTHORNOT>(context);
    return Container(
      color: userStauts.changeUserStatus ? Colors.blue : Colors.black,
      child: Column(
        children: [
          Container(width: double.infinity),
          Expanded(
            child: Consumer<GridTileManagerChanger>(
              builder: (context, _, c) {
                return GridView.builder(
                  itemCount: 200,
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    childAspectRatio: 3 / 3,
                    maxCrossAxisExtent: changeGrid.scaleNormal,
                    mainAxisSpacing: 5,
                    crossAxisSpacing: 5,
                  ),
                  itemBuilder: (context, i) {
                    return GestureDetector(
                      onScaleStart: changeGrid.scaleStart,
                      onScaleUpdate: changeGrid.scaleUpdate,
                      onScaleEnd: changeGrid.scaleEnd,
                      child: AnimatedSwitcher(
                        duration: Duration(milliseconds: 1000),
                        child: Container(
                          color: Colors.teal,
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
