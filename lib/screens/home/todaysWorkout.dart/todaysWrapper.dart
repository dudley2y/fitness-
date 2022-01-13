import 'package:fitness/models/workout.dart';
import 'package:fitness/screens/home/todaysWorkout.dart/emptyWorkoutMessage.dart';
import 'package:fitness/screens/home/todaysWorkout.dart/workoutDisplay.dart';
import 'package:flutter/material.dart';

class TodaysWrapper extends StatefulWidget {

  final Workout todaysLifts;

  const TodaysWrapper({ Key? key, required this.todaysLifts }) : super(key: key);

  @override
  _TodaysWrapperState createState() => _TodaysWrapperState();
}

class _TodaysWrapperState extends State<TodaysWrapper> {
  
  @override
  Widget build(BuildContext context) {

    if(widget.todaysLifts.workout.isEmpty){
      return const EmptyWorkoutMessage();

    }else{
      return WorkoutDisplay(today: widget.todaysLifts);
    }
  }
}