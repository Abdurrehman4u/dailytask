import 'package:dailytask/Firebase/FirebaseAuthservices.dart';
import 'package:dailytask/HomeScreen/project.dart';
import 'package:dailytask/signupsignin/signin.dart';
import 'package:flutter/material.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  bool isDark = true;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color.fromRGBO(32, 40, 50, 1.0),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Welcome Back",
                  style: TextStyle(color: Colors.amber, fontSize: 15),
                ),
                FutureBuilder<String?>(
                  future: FirebaseAuthservices().getUsername(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator(); // Show a loading indicator while waiting for data
                    } else if (snapshot.hasError) {
                      return Text(
                          'Error: ${snapshot.error}'); // Show an error message if an error occurs
                    } else {
                      // Data has been successfully fetched
                      String? username = snapshot.data;
                      if (username != null) {
                        // Render the UI with the fetched username
                        return Text(
                          username,
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1),
                        );
                      } else {
                        // Handle the case where username is null
                        return const Text('No username found');
                      }
                    }
                  },
                ),
              ],
            ),
            GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text(
                        "leaving soon 🥺",
                        style: TextStyle(color: Colors.amber),
                      ),
                      backgroundColor: const Color.fromRGBO(68, 90, 100, 1.0),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Icon(Icons.close_rounded,color:Colors.amber ,)
                        ),
                        TextButton(
                          onPressed: () {
                            // Add your logout logic here
                            // For example, you can navigate to the login screen
                            FirebaseAuthservices().signout();
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Signin()));
                          },
                          child: const Text(
                            "Logout",
                            style: TextStyle(color: Colors.amber),
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Image.asset("assets/user-profile.png"),
            )
          ],
        ),
      ),
      body: Column(
        children: [
          Column(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(20, 10, 20, 0) ,
                child: SearchAnchor(
                  builder: (BuildContext context, SearchController controller) {
                    return SearchBar(
                      controller: controller,
                      onTap: () {
                        // controller.openView();
                      },
                      onChanged: (_) {
                        controller.openView();
                      },
                      leading: const Icon(Icons.search),
                      padding: const MaterialStatePropertyAll<EdgeInsets>(
                        EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0), // Add margin
                      ),
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.yellow), // Set background color to yellow
                    );
                  },
                  suggestionsBuilder: (BuildContext context, SearchController controller) {
                    return List<ListTile>.generate(0, (int index) {
                      final String item = 'search something';
                      return ListTile(
                        title: Text(item),
                        onTap: () {
                          setState(() {
                            controller.closeView(item);
                          });
                        },
                      );
                    });
                  },
                ),
              ),
            ],
          ),

        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            backgroundColor: Color.fromRGBO(38, 50, 56, 49),
            icon: Icon(Icons.home_outlined),
            label: 'Home',

            // backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.create_new_folder_outlined),
            label: 'create',
            // backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month_outlined),
            label: 'calender',
            // backgroundColor: Colors.purple,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_none_outlined),
            label: 'Settings',
            // backgroundColor: Colors.pink,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }

  Widget completed(BuildContext c, List<String> names, Project p) {
    return GestureDetector(
      onDoubleTap: () {
        Navigator.push(
          c,
          MaterialPageRoute(
            builder: (c) {
              return const Text("chapak");
            },
          ),
        );
      },
      child: Card(
        elevation: 5,
        color: Colors.deepPurpleAccent,
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              child: Column(
                children: [
                  Text(names[0]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
