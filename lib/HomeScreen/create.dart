import 'package:flutter/material.dart';

class Createtask extends StatefulWidget {
  const Createtask({super.key});

  @override
  State<Createtask> createState() => _CreatetaskState();
}

class _CreatetaskState extends State<Createtask> {
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();

  // Function to show Date Picker
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }

  // Function to show Time Picker
  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (pickedTime != null && pickedTime != selectedTime) {
      setState(() {
        selectedTime = pickedTime;
      });
    }
  }

  TextEditingController title = TextEditingController();
  TextEditingController Detail = TextEditingController();
  List<Widget> chips = [];

  @override
  Widget build(BuildContext context) {
    double maxWidth =
        MediaQuery.of(context).size.width * 0.9; // Maximum width for the chips container
    int maxChipsPerRow =
    3; // Maximum number of chips per row
    double chipWidth = maxWidth / maxChipsPerRow;

    return Scaffold(
      backgroundColor: const Color.fromRGBO(32, 40, 50, 1.0),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.amber),
        backgroundColor: const Color.fromRGBO(32, 40, 50, 1.0),
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text('Create Task', style: TextStyle(color: Colors.white))],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(30, 20, 0, 0),
                  child: const Text('Task Title',
                      style: TextStyle(color: Colors.white, fontSize: 25)),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(30, 20, 30, 40),
              child: TextField(
                style: const TextStyle(color: Colors.white),
                controller: title,
                cursorColor: Colors.white,
                decoration: InputDecoration(
                  fillColor: const Color.fromRGBO(68, 90, 100, 1.0),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(30, 20, 0, 0),
                  child: const Text('Task Details',
                      style: TextStyle(color: Colors.white, fontSize: 25)),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(30, 20, 30, 40),
              child: SingleChildScrollView(
                child: TextField(
                  style: const TextStyle(color: Colors.white),
                  controller: Detail,
                  cursorColor: Colors.white,
                  maxLines: 5,
                  decoration: InputDecoration(
                    fillColor: const Color.fromRGBO(68, 90, 100, 1.0),
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
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(30, 10, 0, 10),
                  child: const Text('Add Team Members',
                      style: TextStyle(color: Colors.white, fontSize: 25)),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(30, 10, 30, 0),
              child: Wrap(
                spacing: 10, // Spacing between chips
                runSpacing: 10, // Spacing between rows
                children: [
                  ...chips.map(
                        (chip) => SizedBox(
                      width: chipWidth,
                      child: chip,
                    ),
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                      MaterialStateProperty.all(Colors.amber[300]),
                      fixedSize: MaterialStateProperty.all(
                          const Size.fromHeight(50)),
                      shape: MaterialStateProperty.all<OutlinedBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        chips.add(
                          Chip(
                            label: const Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(4.0),
                                  child: Icon(Icons.perm_identity_outlined),
                                ),
                                Text('Robert',
                                    style: TextStyle(color: Colors.black)),
                              ],
                            ),
                            deleteIcon: const Icon(
                                Icons.cancel_presentation, color: Colors.white),
                            backgroundColor: Colors.blueGrey,
                            onDeleted: () {
                              setState(() {
                                chips.removeLast();
                              });
                            },
                          ),
                        );
                      });
                    },
                    child: const Icon(
                      Icons.add_box_outlined,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(30, 30, 0, 10),
                  child: const Text('Time & Date',
                      style: TextStyle(color: Colors.white, fontSize: 25)),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(30, 10, 0, 0),

              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Container(
                        color: Colors.amberAccent,
                        child: const SizedBox(
                          height: 50,
                          width: 50,
                          child: Icon(Icons.access_time_outlined, color: Colors.black),
                        ),
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.blueGrey),
                          fixedSize: MaterialStateProperty.all(const Size.fromHeight(50)),
                          shape: MaterialStateProperty.all<OutlinedBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),
                        ),
                        onPressed: () => _selectTime(context),
                        child: Text(
                          selectedTime.format(context),
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(width: 16),

                  Row(
                    children: [
                      Container(
                        color: Colors.amberAccent, // Change color to yellow
                        child: const SizedBox(
                          height: 50,
                          width: 50,
                          child: Icon(Icons.calendar_today_outlined, color: Colors.black), // Change icon to calendar
                        ),
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.blueGrey),
                          fixedSize: MaterialStateProperty.all(const Size.fromHeight(50)),
                          shape: MaterialStateProperty.all<OutlinedBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),
                        ),
                        onPressed: () => _selectDate(context),
                        child: Text(
                          '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),


                ],
              ),
            ),
            Center(
              child: Container(margin: const EdgeInsets.fromLTRB(30, 30, 30, 30),
              child:ElevatedButton(
                onPressed: () {

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
                      "Create",
                      style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 15),
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
}
