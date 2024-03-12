import 'package:dailytask/signupsignin/signup.dart';
import 'package:flutter/material.dart';

class Signin extends StatelessWidget {
  const Signin({super.key});

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
                  suffixIcon: IconButton(
                    onPressed: (){

                    },
                    icon:  Image.asset("assets/hide.png"),
                  ),
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
              margin: const EdgeInsets.fromLTRB(0, 0, 14,0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(onPressed: (){}, child: const Text("Forgot Password?",style: TextStyle(color:Color.fromRGBO(68, 90, 100, 1.0),fontWeight: FontWeight.bold )))
                ],
              ),
            ),



            Container(
                margin: const EdgeInsets.fromLTRB(30, 20, 30, 0),
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
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Sign in",
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                )

            ),
            Container(
              margin: const EdgeInsets.fromLTRB(15, 10, 15, 0),
              child: const Center(
                child: Text(
                  "----------- or continue with ------------",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(30, 20, 30, 0),
              decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(10), // Adjust the radius as needed
              ),
              child: ElevatedButton(
                onPressed: () {
                  // Add onPressed callback if needed
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  minimumSize: const Size(310, 60),
                  elevation: 0, // Remove button elevation
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/search.png"), // Add icon here
                    const SizedBox(width: 10), // Add spacing between icon and text
                    const Text(
                      "Google",
                      style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(30, 20, 30, 0),
              child:  Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account?\t",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                    TextButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>const Signup()));

                    }, child: const Text("Sign up",style: TextStyle(color:Colors.amber,fontWeight: FontWeight.bold )))

                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
