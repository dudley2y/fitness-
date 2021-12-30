import 'package:flutter/material.dart';

class EditWorkout extends StatefulWidget {
  const EditWorkout({ Key? key }) : super(key: key);

  @override
  _EditWorkoutState createState() => _EditWorkoutState();
}

class _EditWorkoutState extends State<EditWorkout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(  
        title: const Text("Edit Workouts!"), 
      ),
      body: Column(
        
      ),
    );
  }
}