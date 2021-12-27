import 'package:flutter/material.dart';

import 'mywidgets.dart';

class AddNewWorkout extends StatefulWidget {
  const AddNewWorkout({ Key? key }) : super(key: key);

  @override
  _AddNewWorkoutState createState() => _AddNewWorkoutState();
}

class _AddNewWorkoutState extends State<AddNewWorkout> {
  List<Widget> workoutList = [];
  final TextEditingController eCtrl = TextEditingController();
  FloatingActionButton fabMainButton = FloatingActionButton(onPressed: ()=>print('pressed main'));

  ElevatedButton addWorkoutButton = ElevatedButton(
    onPressed: () {},
    child: const Text('1'),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title : const Text('Adding workout!')),
      body: Column(
        children: <Widget>[
          TextField(
            controller: eCtrl,
            onSubmitted: (text){
              if(text.isNotEmpty){
                workoutList.add(ExerciseWidget(title: eCtrl.text,desc: eCtrl.text));
                eCtrl.clear();
                setState(() {});
              }
            },
          ),
          Expanded(
            child:ListView.builder(
              itemCount: workoutList.length,
              itemBuilder: (BuildContext context,int indx){
                return workoutList[indx];
              },
            )
          ),
          // ExerciseWidget(title:eCtrl.text,desc: eCtrl.text ),
        ],
      ),
    );
  }
}