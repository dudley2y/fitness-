import 'package:fitness/models/workout.dart';
import 'package:fitness/screens/home/todaysWorkout.dart/exercise.dart';
import 'package:flutter/material.dart';

class WorkoutDisplay extends StatefulWidget {
  final Workout today;
  const WorkoutDisplay({ Key? key, required this.today }) : super(key: key);

  @override
  _WorkoutDisplayState createState() => _WorkoutDisplayState();
}

class _WorkoutDisplayState extends State<WorkoutDisplay> {
  @override
  Widget build(BuildContext context) {
        return Expanded(
          child:
            Container(  
              margin: const EdgeInsets.only(top:20),
              decoration: const BoxDecoration(  
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(28), topRight: Radius.circular(28)),
                            color: Color(0xFF006D77),
                          ),
              child: 
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: widget.today.workout.length,
                  itemBuilder: (context, index){
                    return displayExercise(exercise: widget.today.workout[index]);
                  }
                )
          )  
        );
  }   
}