import 'package:flutter/material.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(32, 40, 50, 1.0),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 30),
              child: const Image(
                image: AssetImage("assets/logo.jpeg"),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 7),
              child: const Text(
                "Daily Task",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  letterSpacing: 3,
                  shadows: [
                    Shadow(
                      blurRadius: 10.0, // shadow blur
                      color: Colors.orange, // shadow color
                      offset: Offset(2.0, 2.0), // how much shadow will be shown
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(30, 20, 30, 0),
              child: TextField(
                decoration: InputDecoration(
                  fillColor: const Color.fromRGBO(68, 90, 100, 1.0),
                  hintText: "Enter Username",
                  filled: true,
                  prefixIcon: Image.asset("assets/contact.png"),
                  hintStyle: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.normal),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(3),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(30, 20, 30, 0),
              child: TextField(
                decoration: InputDecoration(
                  fillColor: const Color.fromRGBO(68, 90, 100, 1.0),
                  hintText: "Enter Email",
                  filled: true,
                  prefixIcon: Image.asset("assets/user-profile.png"),
                  hintStyle: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.normal),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(3),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(30, 20, 30, 0),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  fillColor: const Color.fromRGBO(68, 90, 100, 1.0),
                  hintText: "Enter Password",
                  prefixIcon: Image.asset("assets/security.png"),
                  filled: true,
                  hintStyle: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.normal),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(3),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(25, 10, 10, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Checkbox(
                    value: false,
                    onChanged: (bool? newValue) {
                      // Handle checkbox state change here
                    },
                  ),
                  const Expanded(
                    child: Text(
                      "I have Read & Agreed to Daily Task Privacy Policy, Terms & Condition",
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: ElevatedButton(
                onPressed: () {
                  // Add onPressed callback if needed
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // Adjust the radius as needed
                  ),
                  backgroundColor: Colors.amber,
                  minimumSize: const Size(310, 60),
                ),
                child: const Text(
                  "Sign Up",
                  style: TextStyle(color: Colors.black),
                ),
              )

            )
          ],
        ),
      ),
    );
  }
}
