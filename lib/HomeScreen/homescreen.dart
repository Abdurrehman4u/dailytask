import 'package:dailytask/Firebase/FirebaseAuthservices.dart';
import 'package:dailytask/HomeScreen/calender.dart';
import 'package:dailytask/HomeScreen/create.dart';
import 'package:dailytask/HomeScreen/fullscreenview.dart';
import 'package:dailytask/HomeScreen/sampledata.dart';
import 'package:dailytask/HomeScreen/showSearch.dart';
import 'package:dailytask/signupsignin/signin.dart';
import 'package:dailytask/utils/widgets.dart';
import 'package:flutter/material.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  int _selectedIndex = 0;
  List<int> completeCount = [];
  List<int> notcompleteCount = [];
  List<int> indexes = [];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if(_selectedIndex == 1){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Createtask()),
        );
      }else if(_selectedIndex == 2){
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) =>   const Calender()),
        );

      }
    });
  }

  @override
  void initState() {
    super.initState();
    getCompletedCount();
    getNotCompleteCount();
  }

  bool isDark = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                            child: const Icon(
                              Icons.close_rounded,
                              color: Colors.amber,
                            )),
                        TextButton(
                          onPressed: () {
                            FirebaseAuthservices().signout();
                            Navigator.pushReplacement(
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
          Row(
            children: [
              Expanded(
                child: Container(
                  margin: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                  child: SearchAnchor(
                    builder:
                        (BuildContext context, SearchController controller) {
                      return SearchBar(

                        controller: controller,

                        leading: IconButton(onPressed: (){
                          // print(controller.text);
                          search(controller.text);
                        },icon: const Icon(Icons.search)),
                        padding: const WidgetStatePropertyAll<EdgeInsets>(
                          EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 8.0), // Add margin
                        ),
                        backgroundColor: WidgetStateProperty.all<Color>(
                            Colors.yellow),
                      );
                    },
                    suggestionsBuilder:
                        (BuildContext context, SearchController controller) {
                      return List<ListTile>.generate(0, (int index) {
                        const String item = 'search something';
                        return ListTile(
                          title: const Text(item),
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
              ),
              Container(
                height: 40,
                width: 40,
                color: Colors.amber,
                margin: const EdgeInsets.fromLTRB(0, 10, 10, 0),
                child: IconButton(
                  icon: const Icon(Icons.filter_alt_outlined),
                  onPressed: () {},
                ),
              ),
            ],
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Container(
                margin: const EdgeInsets.fromLTRB(20, 30, 0, 10),
                child: const Text(
                  "Completed Tasks",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                )),
            Container(
                margin: const EdgeInsets.fromLTRB(20, 30, 0, 10),
                child: TextButton(
                  onPressed: () {
                    getNotCompleteCount();
                    getCompletedCount();
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Fullscreenview(isCompleted: true,completedIndex: completeCount,notCompletedIndex: notcompleteCount,)));
                  },
                  child: const Text(
                    'See all',
                    style: TextStyle(color: Colors.amber),
                  ),
                ))
          ]),
          Builder(builder: (BuildContext context){
              getCompletedCount();
            if(completeCount.isEmpty){
              return const Text("Yet to Complete a task",style: TextStyle(
                color: Colors.amber,fontSize: 30,
              ),);
            }
            else{

              return Expanded(
                flex: 1,
                child: Container(
                  margin: const EdgeInsets.fromLTRB(10, 0, 10, 0
                  ),
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: completeCount.length,
                      itemBuilder: (BuildContext context,int index){

                        return completed(context, sampleData.dataCard[completeCount[index]],completeCount[index]);
                      }

                  ),
                ),
              );
            }

          }),

          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Container(
                margin: const EdgeInsets.fromLTRB(20, 30, 0, 10),
                child: const Text(
                  "Ongoing Projects",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                )),
            Container(
                margin: const EdgeInsets.fromLTRB(20, 30, 0, 10),
                child: TextButton(
                  onPressed: () {
                    getCompletedCount();
                    getNotCompleteCount();
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Fullscreenview(isCompleted: false,completedIndex: completeCount,notCompletedIndex: notcompleteCount,)));

                  },
                  child: const Text(
                    'See all',
                    style: TextStyle(color: Colors.amber),
                  ),
                ))
          ]),
          Builder(builder: (BuildContext context){
            getNotCompleteCount();
            if(notcompleteCount.isEmpty){
              return const Text("No task due",style: TextStyle(
                color: Colors.amber,fontSize: 30,
              ),);
            }else{
              return Expanded(
                child: Container(
                  margin: const EdgeInsets.fromLTRB(10, 0, 10, 0
                  ),
                  child: ListView.builder(
                    itemCount: notcompleteCount.length,
                      itemBuilder: (BuildContext context,int index){
                        return onGoing(context, sampleData.dataCard[notcompleteCount[index]],notcompleteCount[index]);
                      }

                  ),
                ),
              );
            }
          }),

        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromRGBO(38, 50, 56, 49),
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
            backgroundColor: Color.fromRGBO(38, 50, 56, 49),

            // backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month_outlined),
            label: 'calender',
            backgroundColor: Color.fromRGBO(38, 50, 56, 49),
            // backgroundColor: Colors.purple,
          ),
        ],
        currentIndex: _selectedIndex,
        unselectedLabelStyle: const TextStyle(color: Colors.white),
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }

  List<int> getCompletedCount(){
    completeCount.clear();
    for (var i = 0; i < sampleData.dataCard.length; i++ ){
      if(sampleData.dataCard[i].getPercentage()==100){
        completeCount.add(i);
      }
    }

    return completeCount;
  }
  List<int> getNotCompleteCount(){
    notcompleteCount.clear();
    for(var i=0;i<sampleData.dataCard.length;i++){
      if(sampleData.dataCard[i].getPercentage()!=100){
        notcompleteCount.add(i);
      }
    }

    return notcompleteCount;
  }

  void search(String s){
    int l  = sampleData.dataCard.length;

    for(int i=0;i<l;i++){
      if(sampleData.dataCard[i].Tasksname==s){
        indexes.add(i);
      }
    }
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Showsearch(index: indexes)));
  }
}
