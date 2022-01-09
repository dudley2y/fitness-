/**
 * This is a file I use to test DB pings
 */
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

class DataBaseRetrieve extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _DataBaseRetrieve();
}

class _DataBaseRetrieve extends State<DataBaseRetrieve> {
  @override
  Widget build(BuildContext context) {
    return Text("foobar");
  }
}

void printDBInfo(String uid) {
  final dbs = DatabaseService(uid: uid);
  var foo;
  var idk = dbs.getUserSplitNames().then((value) {
    foo = value;
    print(value.docs.length);
  }).catchError((onError) {
    print(onError);
  });
  print('not yet');
}
