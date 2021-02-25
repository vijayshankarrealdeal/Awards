import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:voiceApp/app/home/change.dart';
import 'package:voiceApp/app/home/homescreen.dart';
import 'package:voiceApp/services/auth.dart';

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
    return MaterialApp(
      home: ChangeNotifierProvider<ChangeofPage>(
          create: (context) => ChangeofPage(), child: HomeScreen()),
    );
  }
}
