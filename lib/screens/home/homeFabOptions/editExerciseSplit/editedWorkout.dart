import 'package:flutter/material.dart';

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
    return Scaffold(
      appBar: AppBar(  
        title: Text("Edit " + widget.workoutName),
      ),
      body: Text(widget.workoutName),
    );
  }
}