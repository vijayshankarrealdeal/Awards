import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';

class StorageServies extends ChangeNotifier {
  double percentage;
  TaskState state;
  final _refrence = FirebaseStorage.instance;
  Future<void> getDownloadUrl(String uid, String fileName) async {
    await _refrence.ref('$uid/$fileName').getDownloadURL();
  }

  Future<void> uploadFile(File file, String uid, String fileName) async {
    try {
      UploadTask task = _refrence.ref('$uid/uploads/fileName').putFile(file);
      task.snapshotEvents.listen((TaskSnapshot snapshot) {
        state = snapshot.state;
        percentage = (snapshot.bytesTransferred / snapshot.totalBytes) * 100;
        notifyListeners();
      });
    } on FirebaseException catch (e) {
      print(e);
    }
  }
}
