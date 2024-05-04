import 'package:dailytask/HomeScreen/create.dart';
import 'package:dailytask/HomeScreen/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class Calender extends StatefulWidget {
  const Calender({super.key});

  @override
  State<Calender> createState() => _CalenderState();
}

class _CalenderState extends State<Calender> {
  final CalendarFormat _calendarFormat = CalendarFormat.week;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    _selectedIndex = index;
    setState(() {
      _selectedIndex = index;
      if (_selectedIndex == 1) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Createtask()),
        );
      } else if (_selectedIndex == 0) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Homescreen()),
        );
      } else if (_selectedIndex == 3) {}
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(32, 40, 50, 1.0),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title:
            const Text('Calendar', style: TextStyle(color: Colors.amberAccent)),
      ),
      body: Column(
        children: [
          TableCalendar(
            firstDay: DateTime(2022),
            lastDay: DateTime(DateTime.now().year + 10),
            focusedDay: _focusedDay,
            calendarFormat: _calendarFormat,
            startingDayOfWeek: StartingDayOfWeek.monday,
            daysOfWeekHeight: 60,
            headerStyle: const HeaderStyle(
                headerMargin: EdgeInsets.all(20),
                titleTextStyle:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                leftChevronVisible: false,
                rightChevronVisible: false,
                formatButtonVisible: false),
            daysOfWeekStyle: const DaysOfWeekStyle(
                weekendStyle: TextStyle(color: Colors.amber),
                weekdayStyle: TextStyle(color: Colors.amber)),
            calendarStyle: const CalendarStyle(
              defaultTextStyle: TextStyle(color: Colors.white),
              weekendTextStyle: TextStyle(color: Colors.white),
              outsideDaysVisible: true,
              todayTextStyle: TextStyle(color: Colors.pinkAccent),
              todayDecoration: BoxDecoration(
                color: Colors.transparent,
                shape: BoxShape.rectangle,
              ),
              selectedTextStyle: TextStyle(backgroundColor: Colors.amber),
              selectedDecoration: BoxDecoration(
                color: Colors.amber,
                shape: BoxShape.rectangle,
              ),
            ),
            onDaySelected: (selectedDay, focusedDay) {
              if (!isSameDay(_selectedDay, selectedDay)) {
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = selectedDay;
                });
              }
            },
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDay, day);
            },
            onPageChanged: (focusedDay) {
              _focusedDay = focusedDay;
            },
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                  margin: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                  child: const Text(
                    "Todays Task",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 30),
                  )),
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
            backgroundColor: Color.fromRGBO(38, 50, 56, 49),

            // backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month_outlined),
            label: 'calender',
            backgroundColor: Color.fromRGBO(38, 50, 56, 49),
            // backgroundColor: Colors.purple,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_none_outlined),
            label: 'notifications',
            backgroundColor: Color.fromRGBO(38, 50, 56, 49),
            // backgroundColor: Colors.pink,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
