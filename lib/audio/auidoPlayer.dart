import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';

class AudioSetup extends ChangeNotifier {
  int _totalDuration;
  int _currentDuration;
  double _completedPercentage = 0.0;
  bool _isPlaying = false;
  int _selectedIndex = 0;
  //
  AudioPlayer audioPlugin = AudioPlayer();
  //
  Future<void> _onPlay({@required String filePath, @required int index}) async {
    AudioPlayer audioPlayer = AudioPlayer();

    if (!_isPlaying) {
      audioPlayer.play(filePath, isLocal: true);

      _selectedIndex = index;
      _completedPercentage = 0.0;
      _isPlaying = true;
      notifyListeners();
      audioPlayer.onPlayerCompletion.listen((_) {
        _isPlaying = false;
        _completedPercentage = 0.0;
        notifyListeners();
      });
      audioPlayer.onDurationChanged.listen((duration) {
        _totalDuration = duration.inMicroseconds;
        notifyListeners();
      });

      audioPlayer.onAudioPositionChanged.listen((duration) {
        _currentDuration = duration.inMicroseconds;
        _completedPercentage =
            _currentDuration.toDouble() / _totalDuration.toDouble();
        notifyListeners();
      });
    }
  }
}
