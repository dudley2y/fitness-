import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness/services/database_serive.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

class EditedWorkout extends StatefulWidget {
  const EditedWorkout(
    { Key? key, required this.workoutName}) : super(key: key);

    final String workoutName;

  @override
  _EditedWorkoutState createState() => _EditedWorkoutState();
}

class _EditedWorkoutState extends State<EditedWorkout> {

  @override
  Widget build(BuildContext context) {

    DatabaseService(uid: context.read<User?>()!.uid).getUserWorkoutGivenName(widget.workoutName);

    return Scaffold(
      appBar: AppBar(  
        title: Text("Edit " + widget.workoutName),
      ),
      body: Text(widget.workoutName),
    );
  }
}