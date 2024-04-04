import 'package:dailytask/HomeScreen/project.dart';
import 'package:flutter/material.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  String username = 'Abdur Rehman';

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
                Text(
                  username,
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1),
                ),
              ],
            ),
            IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text("Hello there",style: TextStyle(color: Colors.amber),),
                        backgroundColor: const Color.fromRGBO(68, 90, 100, 1.0),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text("close me",style: TextStyle(color: Colors.amber),),
                          ),
                        ],
                      );
                    },
                  );
                }, icon: Image.asset("assets/user-profile.png"))
          ],
        ),
      ),
      body: Column(
        
        children: [
          ListView.builder(itemCount: Project.Groupmembers.length,itemBuilder: (BuildContext context, int index) {
            return Completed(context, Project.Groupmembers,Project.description[index]);
          },)
        ],
      ),
      
    );


  }

  Widget Completed(BuildContext c,List<String> names ,Project p) {
    return GestureDetector(
      onDoubleTap: (){
        Navigator.push(c,MaterialPageRoute(builder: (c){
          return const Text("chapak");
        }));
      },
      child: Card(
        // Remove const modifier
        elevation: 5,
        color: Colors.deepPurpleAccent,
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              child: Column(
                children: [
                  Text(names[0])
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
