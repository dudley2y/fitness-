import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitness/screens/home/homeFab/actionbutton.dart';
import 'package:fitness/screens/home/homeFabOptions/addExerciseSplit/addNewWorkout.dart';
import 'package:fitness/services/authentication_service.dart';
import 'package:fitness/screens/home/homeFabOptions/editExerciseSplit/editWorkout.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
// ignore: implementation_imports
import 'package:provider/src/provider.dart';
import 'package:fitness/screens/home/homeFab/expandablefab.dart';
import 'package:fitness/services/database_serive.dart';
import 'package:fitness/screens/home/globals.dart';
import 'package:fitness/screens/home/homeFabOptions/addExerciseSplit/exerciseWidget.dart';
// import 'package:fitness/screens/home/foo.dart';

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
    String currSplit = 'Upper-Lower'; // will add som scheduling
    // need some form of calendar and scheduling here to confirm the split.
    var templist;
    int len = 0;
    dbService.getUserSplitNames().then((value) {
      templist = value;
      len = templist
          .docs.length; // now load the temp to dailyExcerciseMeta[viewDay]
      // dailyExcerciseMeta[viewDay] = templist.docs;
      print(value.docs.map((DocumentSnapshot document) {
        print(document.id);
        // now that we have this, get the split currently on,
        //then display, see displaySplits for example on how to
      }));
      flag = 1;
    }).catchError((onError) {
      flag = -1;
      print(onError);
    });

    return Scaffold(
      appBar: AppBar(
        title: Text('Schedule for ${intToDay(viewDay)}'),
        actions: <Widget>[
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
              ))
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
                      builder: (context) => const AddNewWorkout()));
              setState(() {});
            }),
        ActionButton(
          icon: const Icon(Icons.edit),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const EditWorkout()));
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
              // print("len: ${snapshot.data!.data()}");
              // print("cs: $currSplit ");
              Object? silly = snapshot.data!.data();
              // Map<String,dynamic> foo = silly;
              Map<String, dynamic> users_splits_data =
                  snapshot.data!.data() as Map<String, dynamic>;
              print("usd ${users_splits_data}");
              return Text(snapshot.data!.data()!.runtimeType.toString());
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
