import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:voiceApp/app/functions.dart/RecordingFunctions.dart';
import 'package:voiceApp/app/functions.dart/recordlist_view.dart';

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
            Expanded(
              child: RecordListView(
                records: rec.records,
              ),
            )
          ],
        ),
      )),
    );
  }
}
