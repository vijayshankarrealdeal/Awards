import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart';

class AddVoice extends StatefulWidget {
  @override
  _AddVoiceState createState() => _AddVoiceState();
}

class _AddVoiceState extends State<AddVoice> {
  String _text = '';
  SpeechToText _speechToText;
  void _listen() async {
    bool avaoable = await _speechToText.initialize();
    if (avaoable) {
      _speechToText.listen(
          onResult: (val) => setState(() {
                _text = val.recognizedWords;
              }));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(_text),
          CupertinoButton(
            child: Text('Hello'),
            onPressed: _listen,
          ),
        ],
      ),
    );
  }
}
