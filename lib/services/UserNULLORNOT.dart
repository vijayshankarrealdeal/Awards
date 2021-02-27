import 'package:flutter/cupertino.dart';
import 'package:voiceApp/services/firebase_services/auth.dart';

class UserISAUTHORNOT extends ChangeNotifier {
  bool _stateChanges = false;
  final UserFromAuth user;

  UserISAUTHORNOT({this.user});

  // ignore: unused_element
  void _returnUserStatus() {
    if (user == null) {
      _stateChanges = false;
    } else {
      _stateChanges = true;
    }
    notifyListeners();
  }

  bool get changeUserStatus => _stateChanges;
}
