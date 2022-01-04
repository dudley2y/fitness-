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

class HomeRoute extends StatefulWidget {
  const HomeRoute({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomeRoute();
}

class _HomeRoute extends State<HomeRoute> {
  void logout(BuildContext context) {
    context.read<AuthenticationService>().signOut();
  }

  @override
  Widget build(BuildContext context) {
    final uid = context.read<User?>()!.uid;
    final dbService = DatabaseService(uid: uid);
    // need some form of calendar and scheduling here to confirm the split.

    return Scaffold(
      appBar: AppBar(
        title: Text('Schedule for $todayString'),
        actions: <Widget>[
          Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  viewDay++;
                  viewDay %= 7;
                  setState(() {});
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
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: dbService.users_ref.snapshots(), // dont be dumb
              builder: (context, snapshot) {
                if (!snapshot.hasData) return const Text('Loading...');
                print('foo');
                return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (BuildContext context, int indx) {
                    return Text(snapshot.data!.docs[indx]['first_name']);
                  },
                );
              },
            ),
          ),
          // ExerciseWidget(title:eCtrl.text,desc: eCtrl.text ),
        ],
      ),
    );
  }
}

/**
 * Next up: make each 'ExerciseWidget' clickable, so it expands, showing a description and allowing edits
 */