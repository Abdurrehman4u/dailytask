import 'package:dailytask/HomeScreen/sampledata.dart';
import 'package:dailytask/utils/widgets.dart';
import 'package:flutter/material.dart';

import 'homescreen.dart';
class Showsearch extends StatefulWidget {
  final List<int> index;
  const Showsearch({super.key,required this.index});

  @override
  State<Showsearch> createState() => _ShowsearchState();
}

class _ShowsearchState extends State<Showsearch> {
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

          ],
        ),
      ),
body: Column(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    Builder(
      builder: (context) {
        if(widget.index.isNotEmpty){

        return Expanded(
          child: ListView.builder(itemCount: widget.index.length,itemBuilder: (BuildContext context,int index){
            return completed(context, sampleData.dataCard[widget.index[index]], widget.index[index]);
          }),
        );
        }else{
          return const Center(child: Text("Not Found",style: TextStyle(color: Colors.amber),));
        }
      }
    ),
  ],
),
    );
  }

}
