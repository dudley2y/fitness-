import 'dart:collection';

import 'package:fitness/models/makeABetterName.dart';
import 'package:fitness/screens/home/globals.dart';
import 'package:fitness/screens/home/homeFab/actionbutton.dart';
import 'package:fitness/screens/home/homeFabOptions/addExerciseSplit/addNewWorkout.dart';
import 'package:fitness/services/database_service.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/src/provider.dart';

import 'exerciseWidget.dart';

class CreateSplit extends StatefulWidget {
  CreateSplit({Key? key, required this.name}) : super(key: key);
  final String name;
  int editDay = viewDay = dayToInt('Sunday');
  bool dirty = false;

  // a dirty split is saved/changed locally, but not synced with firebase
  final List<List<Exercise>> _splitMeta = [[], [], [], [], [], [], []];
  @override
  State<StatefulWidget> createState({name}) => _CreateSplit();
}

class _CreateSplit extends State<CreateSplit> {
  int _selectedIndex = 0;
  void _onBottomNavBarTap(int index) {
    if (index == 0) {
      if (widget.editDay <= 0) return;
      widget.editDay--;
      setState(() {});
      return;
    }
    if (widget.editDay >= 6) return;
    widget.editDay++;
    setState(() {});
  }

  Map<String, dynamic> toFbMap(List<List<Exercise>> list) {
    ///map<map<string,array>> => split<excercise<info>> => PPL[Monday][Bench] = 5x5
    ///PPL is covered in widget.name
    Map<String, dynamic> result = {};
    int dayInt = 0;
    for (var day in list) {
      result[intToDay(dayInt)] = {};
      for (var excercise in day) {
        result[intToDay(dayInt)];
        // [excercise.name] = [excercise.set, excercise.rep];
      }
      dayInt++;
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    // one entry per day;
    return Scaffold(
      appBar: AppBar(
        title:
            Text('Create a workout schedule for ${intToDay(widget.editDay)}'),
        actions: [
          IconButton(
            onPressed: () {
              DatabaseService dbs =
                  DatabaseService(uid: context.read<User?>()!.uid);
              FirebaseFirestore.instance.runTransaction((transaction) async {
                DocumentSnapshot fresh =
                    await dbs.getUserSplitNamesAsDocumentSnapshot();
                // fresh.reference.
                Map<String, dynamic> fmap = HashMap();
                fmap[widget.name] = '';
                // return;
                await fresh.reference // add to users_splits_names
                    .collection('names')
                    .doc(widget.name)
                    .set(fmap);
                DocumentSnapshot fresh2 = // add to users_splits
                    // this returns a _jsonQuery
                    dbs.getUserSplits(widget.name) as DocumentSnapshot;
                await fresh2.reference
                    .collection('user_splits')
                    .doc(widget.name)
                    .set(toFbMap(widget._splitMeta));
                widget.dirty = false;
                // await transaction.set(fresh.reference, fmap);
              });
            },
            icon: const Icon(Icons.upload_sharp),
            tooltip: 'Save split to cloud',
          ),
        ],
      ),
      floatingActionButton: ActionButton(
        // new workout button
        icon: const Icon(Icons.add_circle_outlined),
        onPressed: () async {
          await Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => AddNewWorkout(
                        exerciseList: widget._splitMeta[viewDay], //bug?
                        day: widget.editDay,
                      )));
          widget.dirty = true;
          setState(() {});
        },
      ),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: widget._splitMeta[widget.editDay].length,
        itemBuilder: (BuildContext context, int index) {
          return ExerciseWidget(
            //extend to show types
            exercise: widget._splitMeta[widget.editDay][index],
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.arrow_left,
              color: Colors.blue,
            ),
            label: 'left',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.arrow_right,
              color: Colors.blue,
            ),
            label: 'right',
          ),
        ],
        onTap: _onBottomNavBarTap,
        currentIndex: _selectedIndex,
      ),
    );
  }
}
