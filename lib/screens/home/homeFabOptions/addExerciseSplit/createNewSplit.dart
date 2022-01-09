import 'package:fitness/models/makeABetterName.dart';
import 'package:fitness/screens/home/globals.dart';
import 'package:fitness/screens/home/homeFab/actionbutton.dart';
import 'package:fitness/screens/home/homeFabOptions/addExerciseSplit/addNewWorkout.dart';
import 'package:flutter/material.dart';

import 'exerciseWidget.dart';

class CreateSplit extends StatefulWidget {
  CreateSplit({Key? key, required this.name}) : super(key: key);
  final String name;
  final List<List<ExcerciseMeta>> _splitMeta = [[], [], [], [], [], [], []];
  @override
  State<StatefulWidget> createState({name}) => _CreateSplit();
}

class _CreateSplit extends State<CreateSplit> {
  @override
  Widget build(BuildContext context) {
    int editDay = viewDay = dayToInt('Sunday');
    // one entry per day;
    return Scaffold(
        appBar: AppBar(
          title: Text('Create a workout schedule for ${intToDay(editDay)}'),
        ),
        floatingActionButton: ActionButton(
          icon: const Icon(Icons.add_circle_outlined),
          onPressed: () async {
            await Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => AddNewWorkout(
                          metaList: widget._splitMeta,
                          day: editDay,
                        )));

            setState(() {});
          },
        ),
        body: ListView.builder(
          shrinkWrap: true,
          itemCount: widget._splitMeta[editDay].length,
          itemBuilder: (BuildContext context, int index) {
            return ExerciseWidget(
              title: widget._splitMeta[editDay][index].name,
              desc: widget._splitMeta[editDay][index].set +
                  ' x ' +
                  widget._splitMeta[editDay][index].rep,
            );
          },
        ));
  }
}
