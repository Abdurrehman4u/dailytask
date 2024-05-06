import 'package:dailytask/HomeScreen/homescreen.dart';
import 'package:dailytask/HomeScreen/sampledata.dart';
import 'package:flutter/material.dart';
import 'package:msh_checkbox/msh_checkbox.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class Taskdetails extends StatefulWidget {
  final sampleData data;
  const Taskdetails(

      {super.key,required this.data}
      );

  @override
  State<Taskdetails> createState() => _TaskdetailsState();
}

class _TaskdetailsState extends State<Taskdetails> {
  double percent = 50;
  bool status = false;

  TextEditingController taskname = TextEditingController();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color.fromRGBO(32, 40, 50, 1.0),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.amber),
        backgroundColor: const Color.fromRGBO(32, 40, 50, 1.0),
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Task Detail', style: TextStyle(color: Colors.white))
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
             Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.data.Tasksname,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Container(
                      color: Colors.amber,
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.calendar_today_outlined,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Container(
                      color: Colors.transparent,
                      child:  Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Due date \n ${widget.data.Duedate}",
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 100,
                ),
                Row(
                  children: [
                    Container(
                      color: Colors.amber,
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.people_alt_outlined,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Container(
                      color: Colors.transparent,
                      child:  Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            ...List.generate(widget.data.members, (index)=> const Icon(Icons.supervised_user_circle),),

                          ],
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(30, 20, 0, 0),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Project Details",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(30, 10, 30, 30),
              child:  Text(
              widget.data.desc
              ,
                style: const TextStyle(color: Colors.white),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(30, 10, 30, 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Project Progress",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  CircularPercentIndicator(
                    radius: 30.0,
                    lineWidth: 7.0,
                    percent: widget.data.getPercentage() / 100,
                    center: Text(
                      widget.data.getPercentage().toString(),
                      style: const TextStyle(color: Colors.white),
                    ),
                    progressColor: Colors.amber[300],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 70,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(30, 0, 30, 30),
                  child: const Text(
                    "All Tasks",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ],
            ),
            SingleChildScrollView(
              child: SizedBox(
                height: 100 * widget.data.taskList.length.toDouble(),
                child: Expanded(
                  child: ListView.builder(
                    itemCount: widget.data.taskList.length,
                    itemBuilder: (context, index) {
                      return taskCard(
                        widget.data.taskList[index],
                        widget.data.completionStatus[index],
                            (newValue) {
                          setState(() {
                            widget.data.completionStatus[index] = newValue;
                          });
                        },
                      );
                    },
                  ),
                ),
              ),
            ),
            Center(
              child: Container(
                  margin: const EdgeInsets.fromLTRB(30, 30, 30, 30),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                        return const Homescreen();
                      }));
                      // showDialog(
                      //   context: context,
                      //   builder: (BuildContext context) {
                      //     return AlertDialog(
                      //       title: const Text(
                      //         "Enter task Name",
                      //         style: TextStyle(color: Colors.amber),
                      //       ),
                      //       backgroundColor:
                      //           const Color.fromRGBO(68, 90, 100, 1.0),
                      //       content: TextField(
                      //         style: const TextStyle(color: Colors.white),
                      //         cursorColor: Colors.white,
                      //         controller: taskname,
                      //         decoration: InputDecoration(
                      //           fillColor:
                      //               const Color.fromRGBO(32, 40, 50, 1.0),
                      //           hintText: "Enter Task Name",
                      //           filled: true,
                      //           hintStyle: const TextStyle(
                      //             color: Colors.white,
                      //             fontWeight: FontWeight.normal,
                      //           ),
                      //           border: OutlineInputBorder(
                      //             borderRadius: BorderRadius.circular(3),
                      //             borderSide: BorderSide.none,
                      //           ),
                      //         ),
                      //       ),
                      //       actions: [
                      //         TextButton(
                      //           onPressed: () {
                      //             Navigator.of(context).pop();
                      //           },
                      //           child: const Text(
                      //             "add Task",
                      //             style: TextStyle(color: Colors.amber),
                      //           ),
                      //         ),
                      //       ],
                      //     );
                      //   },
                      // );
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            10), // Adjust the radius as needed
                      ),
                      backgroundColor: Colors.amber,
                      minimumSize: const Size(310, 60),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Add Task",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                      ],
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }

  Widget taskCard(String taskName, bool status, Function(bool) onChanged) {
    return Container(
      margin: const EdgeInsets.fromLTRB(30, 10, 30, 30),
      color: Colors.blueGrey,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              taskName,
              style: const TextStyle(color: Colors.white, fontSize: 20),
            ),
            Container(
              color: Colors.amber,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: MSHCheckbox(
                  size: 30,
                  value: status,
                  style: MSHCheckboxStyle.stroke,
                  colorConfig: MSHColorConfig.fromCheckedUncheckedDisabled(
                    checkedColor: Colors.black,
                    uncheckedColor: Colors.black,
                  ),
                  onChanged: onChanged,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
