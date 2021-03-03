import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class UserFromAuth {
  final String uid;
  final String email;

  UserFromAuth({this.uid, this.email});
}

class Auth extends ChangeNotifier {
  final _refrence = FirebaseAuth.instance;
  UserFromAuth _userFromFirebase(user) {
    if (user == null) {
      return null;
    } else {
      return UserFromAuth(uid: user.uid, email: user.email);
    }
  }

  Stream<UserFromAuth> get onAuthChange =>
      _refrence.authStateChanges().map(_userFromFirebase);
}
