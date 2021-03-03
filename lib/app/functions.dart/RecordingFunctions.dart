import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_audio_recorder/flutter_audio_recorder.dart';
import 'package:path_provider/path_provider.dart';

///enums for recording state
enum RecordingState {
  UnSet,
  Set,
  Recording,
  Stopped,
}

///
class RecorddingStartEnd extends ChangeNotifier {
  RecordingState _recordingState = RecordingState.UnSet;
  Icon recordIcons = Icon(CupertinoIcons.mic);
  String recordText = '';
  FlutterAudioRecorder audioRecorder;
  Directory appDirectory;
  Stream<FileSystemEntity> fileStream;
  List<String> records = [];

  void check() {
    FlutterAudioRecorder.hasPermissions.then((hasPermision) {
      if (hasPermision) {
        _recordingState = RecordingState.Set;
        recordIcons = Icon(CupertinoIcons.mic);
        recordText = 'Record';
        notifyListeners();
      }
    });
    notifyListeners();
  }

  ///For Audio

  void setUp() {
    records = [];
    getApplicationDocumentsDirectory().then((value) {
      appDirectory = value;
      appDirectory.list().listen((onData) {
        records.add(onData.path);
      }).onDone(() {
        records = records.reversed.toList();
        notifyListeners();
      });
    });
    notifyListeners();
  }

  ///Start Process
  ///when record Buttonn is Pressed
  Future<void> onRecordButtonPressed(BuildContext context) async {
    switch (_recordingState) {
      case RecordingState.Set:
        await _recordVoice(context);
        notifyListeners();
        break;

      case RecordingState.Recording:
        await _stopRecording();
        _recordingState = RecordingState.Stopped;
        recordIcons = Icon(Icons.fiber_manual_record);
        recordText = 'Record new one';
        notifyListeners();
        break;

      case RecordingState.Stopped:
        await _recordVoice(context);
        notifyListeners();
        break;

      case RecordingState.UnSet:
        print("from here");
        // ignore: deprecated_member_use
        Scaffold.of(context).hideCurrentSnackBar();
        // ignore: deprecated_member_use
        Scaffold.of(context).showSnackBar(SnackBar(
          content: Text('Please allow recording from settings.'),
        ));
        notifyListeners();
        break;
    }
  }

  ///
  ///Record Voice Function
  Future<void> _recordVoice(BuildContext context) async {
    if (await FlutterAudioRecorder.hasPermissions) {
      await _initRecorder();
      await _startRecording();
      _recordingState = RecordingState.Recording;
      recordIcons = Icon(CupertinoIcons.stop);
      recordText = 'Recording';
    } else {
       // ignore: deprecated_member_use
      Scaffold.of(context).hideCurrentSnackBar();
       // ignore: deprecated_member_use
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text('Please allow recording from settings.'),
      ));
    }
    notifyListeners();
  }

  /// Various Recording Parameters
  _initRecorder() async {
    Directory appDirectory = await getApplicationDocumentsDirectory();
    String filePath = appDirectory.path +
        '/' +
        DateTime.now().millisecondsSinceEpoch.toString() +
        '.aac';

    audioRecorder =
        FlutterAudioRecorder(filePath, audioFormat: AudioFormat.AAC);
    await audioRecorder.initialized;
    notifyListeners();
  }

  _startRecording() async {
    await audioRecorder.start();
    // await audioRecorder.current(channel: 0);
    refreshRecords(records);
    notifyListeners();
  }

  _stopRecording() async {
    await audioRecorder.stop();
    _onRecordComplete();
    notifyListeners();
  }

  _onRecordComplete() {
    records.clear();
    appDirectory.list().listen((onData) {
      records.add(onData.path);
    }).onDone(() {
      records.sort();
      records = records.reversed.toList();
    });
    refreshRecords(records);
    notifyListeners();
  }

  void refreshRecords(List<String> d) {
    records = d;
    notifyListeners();
  }

  ///dispose every unit
  void remove() {
    _recordingState = RecordingState.UnSet;
    audioRecorder = null;
    fileStream = null;
    appDirectory = null;
    records = null;
    notifyListeners();
  }
}
