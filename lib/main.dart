import 'package:dailytask/signupsignin/signup.dart';
import 'package:dailytask/splashscreen/splashscreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp( Myapp());
}

class Myapp extends StatelessWidget {
   Myapp({super.key});
  final ThemeData themeData = ThemeData();

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Signup(),
      title: "DailyTask",
    );
  }
}
