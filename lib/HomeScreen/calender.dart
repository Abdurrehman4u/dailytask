import 'package:dailytask/HomeScreen/create.dart';
import 'package:dailytask/HomeScreen/homescreen.dart';
import 'package:dailytask/HomeScreen/sampledata.dart';
import 'package:dailytask/utils/widgets.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';
class Calender extends StatefulWidget {
  const Calender({super.key});

  @override
  State<Calender> createState() => _CalenderState();
}

class _CalenderState extends State<Calender> {
  final CalendarFormat _calendarFormat = CalendarFormat.week;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  int _selectedIndex = 2;
  String sDate = DateFormat('dd MMMM yyyy').format(DateTime.now());
  List<sampleData> datalist = [];
  List<int> dataIndex =[];
  List<DateTime> tasksdates= [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData(sDate);
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
                  sDate = formatDate(_focusedDay);
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
          Expanded(child: Builder(
            builder: (context) {
              getData(sDate);
              if(datalist.isEmpty){
                return const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("No Task today",style: TextStyle(color: Colors.amber),),
                  ],
                );
              }else{

              return ListView.builder(
                  itemCount: datalist.length,
                  itemBuilder: (BuildContext context,int index){
                    return completed(context, datalist[index], dataIndex[index]);
                  });
              }
            }
          ))


        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromRGBO(38, 50, 56, 49),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined,),
            label: 'Home',
            backgroundColor: Color.fromRGBO(38, 50, 56, 49),

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
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
  void _onItemTapped(int index) {
    _selectedIndex = index;
    setState(() {
      _selectedIndex = index;
      if (_selectedIndex == 1) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const Createtask()),
        );
      } else if (_selectedIndex == 0) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const Homescreen()),
        );
      }
    });
  }

  String formatDate(DateTime selectedDate) {
    String formattedDate = DateFormat('dd MMMM yyyy').format(selectedDate);

    return formattedDate;
  }

  void getData(String date){
    datalist.clear();
    dataIndex.clear();
    int len = sampleData.dataCard.length;
    for(int i = 0;i<len;i++){
      if(sampleData.dataCard[i].Duedate == sDate){
        datalist.add(sampleData.dataCard[i]);
        dataIndex.add(i);
      }
    }
  }
}
