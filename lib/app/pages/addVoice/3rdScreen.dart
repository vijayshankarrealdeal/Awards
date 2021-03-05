import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:awards/app/functions.dart/RecordingFunctions.dart';

class AddVoice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("This");
    final rec = Provider.of<RecorddingStartEnd>(context);
    return SafeArea(
      child: Scaffold(
          body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(width: double.infinity),
            Text(
              rec.recordText,
              style: TextStyle(fontSize: 22, color: Colors.black),
            ),
            IconButton(
              icon: rec.recordIcons,
              onPressed: () async {
                await rec.onRecordButtonPressed(context);
              },
            ),
            // Expanded(
            //   child: RecordListView(
            //     records: rec.records,
            //   ),
            // ),
          ],
        ),
      )),
    );
  }
}
