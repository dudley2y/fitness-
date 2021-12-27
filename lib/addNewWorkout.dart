import 'dart:html';

import 'package:fitness/makeABetterName.dart';
import 'package:flutter/material.dart';

import 'mywidgets.dart';

import 'package:fitness/globals.dart';

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
            // add submit button, so we can have multiple text feilds, 
            //one for workout name, another for sets, reps, and will need to add autofill/dropdown
            onSubmitted: (text){
              if(text.isNotEmpty){
                workoutList.add(ExerciseWidget(title: eCtrl.text,desc: eCtrl.text));
                excerciseMeta.add(ExcerciseMeta(name:eCtrl.text,rep:eCtrl.text, set: eCtrl.text, notes: 'none so far',done:false));
                eCtrl.clear();
                setState(() {});
                Navigator.pop(context);
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