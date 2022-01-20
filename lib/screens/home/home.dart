import 'dart:collection';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitness/models/makeABetterName.dart';
import 'package:fitness/screens/home/homeFab/actionbutton.dart';
import 'package:fitness/screens/home/homeFabOptions/addExerciseSplit/addNewWorkout.dart';
import 'package:fitness/services/authentication_service.dart';
import 'package:fitness/screens/home/homeFabOptions/editExerciseSplit/editWorkout.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// ignore: implementation_imports
import 'package:provider/src/provider.dart';
import 'package:fitness/screens/home/homeFab/expandablefab.dart';
import 'package:fitness/services/database_service.dart';
import 'package:fitness/screens/home/globals.dart';
import 'package:fitness/screens/home/homeFabOptions/addExerciseSplit/exerciseWidget.dart';
import 'package:fitness/screens/home/homeFabOptions/addExerciseSplit/nameNewSplit.dart';

// enum _ExerciseType {
//   creps,
//   vreps,
//   timed,
//   circut,
// }

class HomeRoute extends StatefulWidget {
  const HomeRoute({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomeRoute();
}

class _HomeRoute extends State<HomeRoute> {
  void logout(BuildContext context) {
    context.read<AuthenticationService>().signOut();
  }

  int flag = 0;

  int getFlag() {
    return flag;
  }

  @override
  Widget build(BuildContext context) {
    final uid = context.read<User?>()!.uid;
    final dbService = DatabaseService(uid: uid);
    String currSplit = 'PPL'; // will add som scheduling
    // need some form of calendar and scheduling here to confirm the split.
    return Scaffold(
      appBar: AppBar(
        title: Text('Schedule for ${intToDay(viewDay)}'),
        actions: <Widget>[
          Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  viewDay--;
                  if (viewDay < 0) viewDay = 6;
                  setState(() {
                    // printDBInfo(uid);
                    // print('flag ${getFlag()}');
                  });
                },
                child: const Icon(Icons.arrow_back, size: 26.0),
              )),
          Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  viewDay++;
                  viewDay %= 7;
                  setState(() {
                    // printDBInfo(uid);
                    // print('flag ${getFlag()}');
                  });
                },
                child: const Icon(Icons.arrow_forward, size: 26.0),
              )),
        ],
      ),
      floatingActionButton: ExpandableFab(distance: 112, children: [
        // sub buttons from main FAB
        ActionButton(
            icon: const Icon(Icons.add_circle_outlined),
            onPressed: () async {
              await Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AddNewWorkout(
                            exerciseList: dailyExcercises[viewDay],
                            day: viewDay,
                          )));
              setState(() {});
            }),
        ActionButton(
          icon: const Icon(Icons.edit),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const EditWorkout()));
          },
        ),
        ActionButton(
          icon: const Icon(Icons.article_outlined),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => NameSplit()));
          },
        )
      ]),
      body: Column(
        children: <Widget>[
          FutureBuilder(
            future: dbService.getUserSplits(currSplit),
            builder: (BuildContext context,
                AsyncSnapshot<DocumentSnapshot> snapshot) {
              // check for internet connection
              if (snapshot.hasError) {
                return const Text('Error Lmao');
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Text("Loading");
              }
              if (snapshot.data?.data() != null) {
                // print("here");
                Map<String, dynamic> users_splits_data =
                    snapshot.data?.data() as Map<String, dynamic>;
                // populate list
                if (users_splits_data.isEmpty &&
                    dailyExcercises[viewDay].isEmpty) {
                  return Text('No plan for ${intToDay(today)}} yet.');
                } else if (users_splits_data.isNotEmpty &&
                    dailyExcercises[viewDay].isEmpty &&
                    !flag2) {
                  flag2 = // display the current workout
                      //TODO : add logic for converting from DB object to list based on different type of exercises
                      true; // not the best way, the .isEmpty should correspond to the day appended to, but this works
                  // for (var day in users_splits_data[currSplit].keys) {
                  //   for (var ex in users_splits_data[currSplit][day].keys) {
                  //     dailyExcercises[dayToInt(day)].add(Exercise(
                  //         name: ex ?? 'null', type: ExerciseType.creps));
                  //   }
                  // }
                }
              }
              // here we actually display the local list
              return ListView.builder(
                shrinkWrap: true,
                itemCount: dailyExcercises[viewDay].length,
                itemBuilder: (BuildContext context, int index) {
                  return ExerciseWidget(
                    exercise: dailyExcercises[viewDay][index],
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}

/**
 * Next up: make each 'ExerciseWidget' clickable, so it expands, showing a description and allowing edits
 */
