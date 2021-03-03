import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:awards/models/userInfromation.dart';

abstract class Database {
  //to add userdetails
  Future<void> createUser(UserInformation information);
  Stream<List<UserInformation>> getUserData(String uid);
}

class DatabaseLogice extends Database with ChangeNotifier {
  final String uid;
  DatabaseLogice({@required this.uid});

  final _refrence = FirebaseFirestore.instance;

  Future<void> createUser(UserInformation information) {
    final path = '/user/$uid';
    return _refrence.doc(path).set(information.toJson());
  }

  Stream<List<UserInformation>> getUserData(String uid) {
    return _refrence
        .collection('user')
        .where("uid", isEqualTo: uid)
        .limit(2)
        .snapshots()
        .map((event) =>
            event.docs.map((e) => UserInformation.fromJson(e.data())).toList());
  }
}
