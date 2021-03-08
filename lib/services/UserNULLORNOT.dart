import 'package:awards/services/firebase_services/auth.dart';
import 'package:flutter/cupertino.dart';

class UserISAUTHORNOT extends ChangeNotifier {
  bool _stateChanges = false;
  final UserFromAuth user;

  UserISAUTHORNOT({this.user});

//

  bool checkUserIsVerifiedOrNot() {
    if (user.user.emailVerified) {
      notifyListeners();
      return true;
    } else {
      notifyListeners();
      return false;
    }
  }

  ///
  Future<void> updatePassword(String newPassword) async {
    try {
      await user.user.updatePassword(newPassword);
    } catch (e) {
      throw e;
    }
  }

  ///

  ///
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
