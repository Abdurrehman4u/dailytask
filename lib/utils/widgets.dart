import 'package:dailytask/HomeScreen/taskdetails.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

Widget completed(BuildContext c, String task, String names, int percentage) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        c,
        MaterialPageRoute(
          builder: (c) {
            return const Taskdetails();
          },
        ),
      );
    },
    child: SizedBox(
      width: 250, // Specify the desired width
      height: 210, // Specify the desired height
      child: Card(
        elevation: 5,
        color: const Color.fromRGBO(69, 90, 100, 10),
        clipBehavior: Clip.antiAlias,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: Text(
                      task,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(10),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Team Members",
                          style: TextStyle(color: Colors.white, fontSize: 10),
                        ),
                        Icon(Icons.supervised_user_circle),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Completed",
                          style: TextStyle(color: Colors.white),
                        ),
                        Text("$percentage%")
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(10, 0, 0, 10),
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        double containerWidth =
                            constraints.maxWidth; // Get the width of the Card
                        return LinearPercentIndicator(
                          width: containerWidth *
                              0.8, // Adjust the width of the progress bar based on the Card's width
                          lineHeight: 14.0,
                          percent: percentage /
                              100, // Convert percentage to a value between 0 and 1
                          backgroundColor: Colors.white,
                          progressColor: Colors.blue,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget onGoing(
    BuildContext c, String task, String team, int percent, String date) {
  return GestureDetector(
    onTap: (){
      Navigator.push(
        c,
        MaterialPageRoute(
          builder: (c) {
            return const Taskdetails();
          },
        ),
      );
    },
    child: SizedBox(
      height: 150,
      width: MediaQuery.of(c).size.width * 0.9,
      child: Card(
        elevation: 5,
        color: const Color.fromRGBO(69, 90, 100, 10),
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: [
            Container(
              alignment: AlignmentDirectional.topStart,
              margin: const EdgeInsets.fromLTRB(10, 10, 0, 10),
              child: Text(
                task,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    letterSpacing: 3,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              alignment: AlignmentDirectional.topStart,
              margin: const EdgeInsets.fromLTRB(10, 0, 0, 0),
              child: const Text(
                "Team members",
                style: TextStyle(color: Colors.white),
              ),
            ),
            Container(
              alignment: AlignmentDirectional.topStart,
              margin: const EdgeInsets.fromLTRB(10, 0, 0, 2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      const Row(
                        children: [
                          Icon(Icons.supervised_user_circle),
                          Icon(Icons.supervised_user_circle),
                          Icon(Icons.supervised_user_circle),
                        ],
                      ),
                      Container(
                          alignment: AlignmentDirectional.bottomStart,
                          margin: const EdgeInsets.fromLTRB(7, 10, 0, 2),
                          child: Text(
                            date,
                            style: const TextStyle(color: Colors.white),
                          ))
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                    child: CircularPercentIndicator(
                      radius: 30.0,
                      lineWidth: 7.0,
                      percent: percent /
                          100,
                      center: Text(percent.toString()),
                      progressColor: Colors.amber[300],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    ),
  );


}


