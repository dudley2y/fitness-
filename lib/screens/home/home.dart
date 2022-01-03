import 'package:fitness/screens/home/homeFab/actionbutton.dart';
import 'package:fitness/screens/home/homeFabOptions/addExerciseSplit/addNewWorkout.dart';
import 'package:fitness/services/authentication_service.dart';
import 'package:fitness/screens/home/homeFabOptions/editExerciseSplit/editWorkout.dart';
// import 'package:fitness/dynamiclist.dart';
// import 'package:fitness/mywidgets.dart';
import 'package:flutter/material.dart';
// ignore: implementation_imports
import 'package:provider/src/provider.dart';
import 'package:intl/intl.dart';
import 'package:fitness/screens/home/homeFab/expandablefab.dart';
// import 'package:fitness/models/makeABetterName.dart';
// import 'dart:math' as math;
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

  String getDay() {
    return DateFormat('EEEE').format(DateTime.now());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Schedule for ${getDay()}')),
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
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const EditWorkout()));
          },
        )
      ]),
      body: Column(
        children: <Widget>[
          Expanded(
              child: ListView.builder(
            itemCount: excerciseMeta.length,
            itemBuilder: (BuildContext context, int indx) {
              return ExerciseWidget(
                  title: excerciseMeta[indx].name,
                  desc: excerciseMeta[indx].set);
            },
          )),
          // ExerciseWidget(title:eCtrl.text,desc: eCtrl.text ),
        ],
      ),
    );
  }
}

/**
 * Next up: make each 'ExerciseWidget' clickable, so it expands, showing a description and allowing edits
 */