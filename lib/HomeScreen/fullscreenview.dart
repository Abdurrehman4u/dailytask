import 'package:dailytask/HomeScreen/sampledata.dart';
import 'package:flutter/material.dart';

import '../utils/widgets.dart';
import 'homescreen.dart';

class Fullscreenview extends StatefulWidget {
  final bool isCompleted;
  final List<int> completedIndex;
  final List<int> notCompletedIndex;

  const Fullscreenview({super.key,
    required this.isCompleted,required this.completedIndex, required this.notCompletedIndex
  });

  @override
  State<Fullscreenview> createState() => _FullscreenviewState();
}

class _FullscreenviewState extends State<Fullscreenview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(32, 40, 50, 1.0),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            IconButton(onPressed: (){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const Homescreen()));

            }, icon: const Icon(Icons.arrow_back,color: Colors.amber,)),
            Center(child: Text(widget.isCompleted? 'Completed Tasks': 'Ongoing Tasks', style: const TextStyle(color: Colors.white))),

          ],
        ),
      ),

      body: Builder(
        builder: (context) {
          if(widget.isCompleted){
            if(widget.completedIndex.isEmpty){
              return const Column(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  Center(child: Text("Yet to Complete a Task",style: TextStyle(color: Colors.amber),)),
                ],
              );
            }else{
              return ListView.builder(
                  itemCount: widget.completedIndex.length ,
                  itemBuilder: (BuildContext context,int index){
                      return completed(context,sampleData.dataCard[widget.completedIndex[index]],widget.completedIndex[index]);
                  });
            }


          }else{
            if(widget.notCompletedIndex.isEmpty){
              return const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(child: Text("No task Pending",style: TextStyle(color: Colors.amber),)),
                ],
              );
            }else{
              return ListView.builder(
                  itemCount: widget.notCompletedIndex.length ,
                  itemBuilder: (BuildContext context,int index){
                    return onGoing(context,sampleData.dataCard[widget.notCompletedIndex[index]],widget.notCompletedIndex[index]);

                  });
            }
          }
        }
      ),
    );
  }
}
