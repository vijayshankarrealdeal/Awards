import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

abstract class AuthBase {
  Stream<UserFromAuth> get onAuthChange;
  Future<UserFromAuth> currentUser();
  Future<UserFromAuth> signInWithEmail(String email, String password);
  Future<UserFromAuth> signUpWithEmail(String email, String password);
  Future<void> forgetPassword(String email);
  Future<void> signOut();
}

class UserFromAuth {
  final String uid;
  final String email;
  UserFromAuth({@required this.uid, @required this.email});
}

class Auth extends AuthBase {
  final auth = FirebaseAuth.instance;
  UserFromAuth _userFromFirebase(user) {
    if (user == null) {
      return null;
    } else {
      return UserFromAuth(uid: user.uid, email: user.email);
    }
  }

  @override
  Stream<UserFromAuth> get onAuthChange {
    return auth.authStateChanges().map(_userFromFirebase);
  }

  @override
  Future<UserFromAuth> currentUser() async {
    final user = auth.currentUser;
    return _userFromFirebase(user.uid);
  }

  @override
  Future<UserFromAuth> signInWithEmail(String email, String password) async {
    final userCred =
        await auth.signInWithEmailAndPassword(email: email, password: password);
    return _userFromFirebase(userCred.user);
  }

  @override
  Future<UserFromAuth> signUpWithEmail(String email, String password) async {
    final userCred = await auth.createUserWithEmailAndPassword(
        email: email, password: password);
    return _userFromFirebase(userCred.user);
  }

  @override
  Future<void> forgetPassword(String email) async {
    await auth.sendPasswordResetEmail(email: email);
  }

  @override
  Future<void> signOut() async {
    await auth.signOut();
  }
}

//18:24:99:7A:2D:87:50:09:BA:91:36:3F:3C:BD:98:C6:71:BD:D1:E5
//SHA-256: 8F:6A:05:7A:AB:F3:DD:3D:2E:17:63:A1:E4:33:14:0F:66:16:DC:C7:7C:30:A0:D9:83:85:4B:15:19:F0:63:F0
