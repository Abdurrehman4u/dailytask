import 'package:dailytask/Firebase/FirebaseAuthservices.dart';
import 'package:dailytask/HomeScreen/homescreen.dart';
import 'package:dailytask/signupsignin/signin.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'firebase_options.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp( Myapp());
}

class Myapp extends StatelessWidget {
   Myapp({super.key});
  final ThemeData themeData = ThemeData();
  final isLoggedin = FirebaseAuthservices().isUserSignedIn();
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: isLoggedin ? const Homescreen() : const Signin(),
      title: "DailyTask",
    );
  }
}
