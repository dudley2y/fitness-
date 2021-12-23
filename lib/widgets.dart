import 'package:flutter/material.dart';

class WorkoutWidget extends StatelessWidget{
  String title = '';
  // int sets,reps;
  String desc = '';
  WorkoutWidget({title,desc});

  @override
  Widget build (BuildContext context){
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        vertical: 32.0,
        horizontal: 24.0,
      ),
      margin: EdgeInsets.only(
        bottom: 20.0,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title ?? "Custom_Exercise",
            style: TextStyle(
              color: Colors.red,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            )
          ),
          Padding(
            padding: EdgeInsets.only(top : 10.0),
            child: Text(
              // desc ?? sets.toString() + " x " + reps.toString(),
              desc ?? "example description",
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.green,
                height: 1.5,
              ),
            )
          )
        ],
      )
    
    );
  }
}