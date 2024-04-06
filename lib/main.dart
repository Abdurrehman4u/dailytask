import 'package:dailytask/Firebase/FirebaseAuthservices.dart';
import 'package:dailytask/HomeScreen/homescreen.dart';
import 'package:dailytask/signupsignin/signin.dart';
import 'package:dailytask/signupsignin/signup.dart';
import 'package:dailytask/splashscreen/splashscreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp( Myapp());
}

class Myapp extends StatelessWidget {
   Myapp({super.key});
  final ThemeData themeData = ThemeData();
  bool isLoggedin = FirebaseAuthservices().isUserSignedIn();
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: isLoggedin ? const Homescreen() : const Signin(),
      title: "DailyTask",
    );
  }
}
