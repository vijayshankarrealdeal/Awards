import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class UserFromAuth {
  final String uid;
  final String email;
  final User user;
  UserFromAuth({this.uid, this.user, this.email});
}

class Auth extends ChangeNotifier {
  final _refrence = FirebaseAuth.instance;
  UserFromAuth _userFromFirebase(User user) {
    if (user == null) {
      return null;
    } else {
      return UserFromAuth(uid: user.uid, user: user, email: user.email);
    }
  }

  Stream<UserFromAuth> get onAuthChange =>
      _refrence.authStateChanges().map(_userFromFirebase);

  Future<UserFromAuth> signUpLogin(String email, String password) async {
    final UserCredential result = await _refrence
        .createUserWithEmailAndPassword(email: email, password: password);

    try {
      await result.user.sendEmailVerification(); 
      return _userFromFirebase(result.user);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<UserFromAuth> signIn(String email, String password) async {
    final result = await _refrence.signInWithEmailAndPassword(
        email: email, password: password);
    try {
      return _userFromFirebase(result.user);
    } catch (e) {
      throw e;
    }
  }

  Future<void> signOut() async {
    try {
      await _refrence.signOut();
    } catch (e) {
      throw e;
    }
  }
}
