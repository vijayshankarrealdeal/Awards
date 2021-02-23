import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:voiceApp/models/userInfromation.dart';

abstract class Database {
  //to add userdetails
  Future<void> createUser(UserInformation information);
}

class DatabaseLogice extends Database with ChangeNotifier {
  final String uid;
  DatabaseLogice({@required this.uid});

  final _refrence = FirebaseFirestore.instance;

  Future<void> createUser(UserInformation information) {
    final path = '/user/$uid';
    return _refrence.doc(path).set(information.toJson());
  }
}
