import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness/models/split.dart';
import 'package:fitness/screens/home/globals.dart';
import 'package:fitness/services/database_service.dart';
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
  Widget build(BuildContext context)  {

    return Scaffold(
      appBar: AppBar(  
        title: Text("Edit " + widget.workoutName),
      ),
      body: 
       FutureBuilder(
      future: DatabaseService(uid: context.read<User?>()!.uid).getUserWorkoutGivenName2(widget.workoutName),
      builder: 
        (BuildContext context, AsyncSnapshot<Split> currSplit){
          
          if(currSplit.hasError){
            return const Text("Something went wrong");
          }

          if(currSplit.connectionState == ConnectionState.waiting){
            return const Text("Loading");
          }
          
          final List<String> daysOftheWeek = ["Sunday", "Monday", "Tuesday", "Wensday", "Thursday", "Friday", "Saturday"];

          final curr_day = today;

          final todaysData = currSplit.data?.getData(daysOftheWeek[curr_day]);
        
          print(todaysData);
        

          return Text("HI");
        }

    )
    );
  }
}