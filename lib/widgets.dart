import 'package:flutter/material.dart';

class ExerciseWidget extends StatelessWidget {
  String title;
  String desc;
  ExerciseWidget({this.title = 'Exercise', this.desc = 'Plan'});
  @override
  Widget build(BuildContext context) {
    // String title;
    // String desc;
    return Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 5.0),
        decoration: BoxDecoration(
            color: Colors.blue[200], borderRadius: BorderRadius.circular(20)),
        child: Column(children: [
          Text(
            title ?? 'Today',
            style: TextStyle(height: 1.5),
          ),
          Text(
            desc ?? 'Plan',
            style: TextStyle(height: 1.5),
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
    print(exercises);
  }

  List<Widget> _getExcercises() {
    return exercises;
  }

  Widget at(int i) {
    return exercises[i];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListView.builder(
              itemBuilder: (_, index) => at(index),
              itemCount: exercises.length,
              shrinkWrap: true,
            ),
            // GridView.count(
            //   shrinkWrap: true,
            //   crossAxisCount: 2,
            //   // mainAxisSpacing: 4.0,
            //   // crossAxisSpacing: 4.0,
            //   physics: const NeverScrollableScrollPhysics(),
            //   children: const [Text('1'), Text('2'), Text('3'), Text('4')],
            // ),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    addExcercise(ExerciseWidget(
                      title: exerciseCont.text,
                      desc: descCont.text,
                    ));
                    exerciseCont.clear();
                    descCont.clear();
                  });
                },
                child: const Text("Add New")),
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
