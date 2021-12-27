import 'package:flutter/material.dart';
import 'package:fitness/expandablefab.dart';

class ExerciseWidget extends StatelessWidget {
  final String title;
  final String desc;
  const ExerciseWidget({
    Key? key,  
    required this.title, 
    required this.desc
    }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // String title;
    // String desc;
    return Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 5.0),
        decoration: BoxDecoration(
            color: Colors.blue[200], borderRadius: BorderRadius.circular(20)),
        child: Column(children: [
          Text(
            title,
            style: const TextStyle(height: 1.5),
          ),
          Text(
            desc,
            style: const TextStyle(height: 1.5),
          ),
        ]));
  }
}

class WorkoutWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => WorkoutWidgetState();
}

class WorkoutWidgetState extends State {
  final exerciseCont = TextEditingController();
  final descCont = TextEditingController();

  List<ExerciseWidget> exercises = [
    ExerciseWidget(title: 'today', desc: 'nothin')
  ];
  //add new excercise ew to list
  // returns this
  void addExcercise(ExerciseWidget ew) {
    exercises.add(ew);
  }

  List<Widget> _getExcercises() {
    return exercises;
  }

  Widget at(int i) {
    return exercises[i];
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:  450,
      child: Column(children: [
        ListView.builder(
          itemBuilder: (_, index) => at(index),
          itemCount: exercises.length,
          shrinkWrap: true,
        ),
        ElevatedButton(
            onPressed: () {
              setState(() {
                addExcercise(ExerciseWidget(
                  title: exerciseCont.text,
                  desc: '!1',
                ));
              });
            },
            child: const Text("Add New")),
        TextField(
          controller: exerciseCont,
        ),
      ]),
    );
  }
}

class WorkoutWidget1 extends StatelessWidget {
  String title = '';
  // int sets,reps;
  String desc = '';
  WorkoutWidget1({title, desc});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
          vertical: 32.0,
          horizontal: 24.0,
        ),
        margin: const EdgeInsets.only(
          bottom: 20.0,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style: const TextStyle(
                  color: Colors.red,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                )),
            Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Text(
                  // desc ?? sets.toString() + " x " + reps.toString(),
                  desc,
                  style: const TextStyle(
                    fontSize: 14.0,
                    color: Colors.green,
                    height: 1.5,
                  ),
                ))
          ],
        ));
  }
}
