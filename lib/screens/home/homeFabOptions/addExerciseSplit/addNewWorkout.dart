import 'dart:html';

import 'package:fitness/models/makeABetterName.dart';
import 'package:flutter/material.dart';

import 'exerciseWidget.dart';

import 'package:fitness/screens/home/globals.dart';

class AddNewWorkout extends StatefulWidget {
  const AddNewWorkout({Key? key}) : super(key: key);

  @override
  _AddNewWorkoutState createState() => _AddNewWorkoutState();
}

class _AddNewWorkoutState extends State<AddNewWorkout> {
  List<Widget> workoutList = [];
  final TextEditingController excersizeNameCtl =
      TextEditingController(text: 'Excercise Name Here');
  final TextEditingController setCtl = TextEditingController(text: 'Sets');
  final TextEditingController repCtl = TextEditingController(text: 'Reps');
  FloatingActionButton fabMainButton =
      FloatingActionButton(onPressed: () => print('pressed main'));

  ElevatedButton addWorkoutButton = ElevatedButton(
    onPressed: () {},
    child: const Text('1'),
  );

  @override
  Widget build(BuildContext context) {
    String name = '', reps = '', sets = '';
    return Scaffold(
      appBar: AppBar(title: const Text('Adding workout!')),
      body: Column(
        children: <Widget>[
          TextField(
            controller: excersizeNameCtl,
            onTap: () => excersizeNameCtl.clear(),
            // add submit button, so we can have multiple text feilds,
            //one for workout name, another for sets, reps, and will need to add autofill/dropdown
            onSubmitted: (text) {
              if (text.isNotEmpty) {
                name = excersizeNameCtl.text;
              }
            },
          ),
          TextField(
            controller: setCtl,
            onTap: () => setCtl.clear(),
            // add submit button, so we can have multiple text feilds,
            //one for workout name, another for sets, reps, and will need to add autofill/dropdown
            onSubmitted: (text) {
              if (text.isNotEmpty) {
                sets = setCtl.text;
              }
            },
          ),
          TextField(
            controller: repCtl,
            onTap: () => repCtl.clear(),
            // add submit button, so we can have multiple text feilds,
            //one for workout name, another for sets, reps, and will need to add autofill/dropdown
            onSubmitted: (text) {
              reps = repCtl.text;
            },
          ),

          ElevatedButton(
              onPressed: () {
                workoutList.add(ExerciseWidget(title: name, desc: reps));
                excerciseMeta.add(ExcerciseMeta(
                    name: excersizeNameCtl.text,
                    rep: repCtl.text,
                    set:  repCtl.text + ' x ' + setCtl.text,
                    notes: 'none so far',
                    done: false));
                excersizeNameCtl.clear();
                setState(() {});
                Navigator.pop(context);
              },
              child: const Text('Add Workout!')),
          // ExerciseWidget(title:eCtrl.text,desc: eCtrl.text ),
        ],
      ),
    );
  }
}


/** 
 * use validator in leiu of controllers, see signup
 */