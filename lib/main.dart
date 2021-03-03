import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:awards/app/functions.dart/RecordingFunctions.dart';
import 'package:awards/app/home/change.dart';
import 'package:awards/app/home/homescreen.dart';
import 'package:awards/services/UserNULLORNOT.dart';
import 'package:awards/services/firebase_services/auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ChangeNotifierProvider<Auth>(
      create: (context) => Auth(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<Auth>(context);

    return MaterialApp(
      home: StreamBuilder<Object>(
          stream: auth.onAuthChange,
          builder: (context, snapshot) {
            UserFromAuth user;
            if (snapshot.hasData) {
              user = snapshot.data;
            }
            return MultiProvider(providers: [
              ChangeNotifierProvider<RecorddingStartEnd>(
                  create: (context) => RecorddingStartEnd()),
              ChangeNotifierProvider<ChangeofPage>(
                  create: (context) => ChangeofPage()),
              ChangeNotifierProvider<UserISAUTHORNOT>(
                  create: (context) => UserISAUTHORNOT(user: user)),
            ], child: HomeScreen());
          }),
    );
  }
}
