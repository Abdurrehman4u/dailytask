import 'package:flutter/material.dart';

class Splashscreen extends StatelessWidget {
  const Splashscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [ Text(
            "Daily",textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white,fontSize: 20,letterSpacing: 10),
          ), Text(
            "Task",textAlign: TextAlign.center,
            style: TextStyle(color: Colors.yellowAccent,fontSize: 20,letterSpacing: 10),
          ),
          ]
        ),

        centerTitle: true,
        backgroundColor: const Color.fromRGBO(32, 40, 50, 1.0),
        leading: IconButton(
          icon: Image.asset(
              'assets/logo.jpeg'), // Replace 'logo.png' with your image asset path
          onPressed: () {
            // Add onPressed callback if needed
          },
        ),
      ),
      backgroundColor: const Color.fromRGBO(32, 40, 50, 1.0),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Align Column children vertically centered
          crossAxisAlignment: CrossAxisAlignment.center, // Align Column children horizontally centered
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center, // Align Row children horizontally centered
              children: [
                Card(
                  color: const Color.fromRGBO(234, 200, 162, 0),
                  clipBehavior: Clip.antiAlias,
                  child: Container(
                    height: 350,
                    margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: Image.asset(
                      "assets/splashscreen.jpeg",
                      height: 400,
                    ),
                  ),
                )
              ],
            ),
            const Row(
              // mainAxisAlignment: MainAxisAlignment.center, // Align Row children horizontally centered
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start, // Align text to the left
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 20), // Add left margin
                      child: Text(
                        "Manage",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 6,
                          fontFamily: "Roboto",
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: 20, top: 10), // Add left and top margin
                      child: Text(
                        "Your",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 6,
                          fontFamily: "Roboto",
                          height: 0.4,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: 20, top: 10), // Add left and top margin
                      child: Text(
                        "Task with",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 6,
                          fontFamily: "Roboto",
                          height: 1.2,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: 20, top: 10), // Add left and top margin
                      child: Text(
                        "DayTask",
                        style: TextStyle(
                          color: Colors.amber,
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 6,
                          fontFamily: "Roboto",
                          height: 0.4,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center, // Align Row children horizontally centered
              children: [
                Column(children: [
                  Container(
                    height: 40,
                    margin: const EdgeInsets.fromLTRB(20, 30, 0, 20),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return const Text(
                                "APP IS UNDER MAINTENANCE STAY TUNED :)");
                          }),
                        );
                      },
                      style: ButtonStyle(
                        backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.amber),
                        minimumSize: MaterialStateProperty.all<Size>(
                          const Size(260, 40), // Set the minimum width and height
                        ),
                      ),
                      child: const Text(
                        "Let's Start",
                        style: TextStyle(
                            fontSize: 18,
                            color:
                            Colors.black), // Optional: Adjust text style if needed
                      ),
                    ),
                  )
                ])
              ],
            )
          ],
        ),
      ),

    );
    // Add other splash screen content here
  }
}
