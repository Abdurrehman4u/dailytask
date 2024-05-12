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

 void addTask(String taskName){
    if (taskName.isEmpty) {
      return;
    }else{
      taskList.add(taskName);
      completionStatus.add(false);
    }
}
void deleteTask(String taskName){
    int index;
    if(taskName.isEmpty){
     return;
    }else{
      index = taskList.indexOf(taskName);
      taskList.removeWhere((element)=> element == taskName);
      completionStatus.removeAt(index);
    }
}
  static List<sampleData> dataCard = [
  sampleData("Real Estate Website", "kdsnakndasknkdsa", "20 June 2023", ["wireframe","wireframe",], "4:30 PM", [true,true], 2)
  ];
}
