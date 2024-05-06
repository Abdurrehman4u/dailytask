// class sampleData {
//  static List<String> Tasksname = [
//     "Real Estate Website",
//     "Finance Mobile App",
//     "Daily task manger",
//     "helpline add on",
//   ];
//  static List<int> members = [1,3,4,5];
// static List<String> desc = [
//   "mdoasmoamslmsda","mdoasmoamslmsda","mdoasmoamslmsda","mdoasmoamslmsda",
// ];
//  static List<int> percentage = [50, 40, 10, 70];
//  static List<String> time = [
//    "4:30 PM","4:30 PM","4:30 PM","4:30 PM"
//  ];
//
//  static List<String> Duedate = ["2023-07-15",
//         "2022-11-28",
//         "2024-03-10",
//         "2023-09-05"
//   ];
//  static List<String> taskList = ["WireFrame","WireFrame","WireFrame","WireFrame"
//  ];
//  static List<bool> completionStatus  = [true,true, false ,false
//  ];
//
// }
import 'package:dailytask/utils/widgets.dart';

class sampleData {

  String Tasksname,desc,Duedate,time;
  int members;
  List<String> taskList = [];
  List<bool> completionStatus = [];

  sampleData(
      this.Tasksname,
      this.desc,
      this.Duedate,
      this.taskList,
      this.time,
      this.completionStatus,
      this.members,


      );

  int getPercentage(){
      int count = completionStatus.length;
      int completedtask = 0;
      for (int i = 0;i<count;i++){
        if(completionStatus[i]==true){
        completedtask = completedtask + 1;
        }

      }
     return ((completedtask/count)*100).toInt();
  }


  static List<sampleData> dataCard = [
    sampleData("Real Estate Website", "kdsnakndasknkdsa", "20 June", ["wireframe","wireframe",], "4:30 PM", [true,true], 2)
  ];
}
