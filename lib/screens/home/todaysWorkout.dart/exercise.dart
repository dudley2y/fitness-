import 'package:fitness/models/makeABetterName.dart';
import 'package:flutter/material.dart';

class displayExercise extends StatelessWidget {
  final Exercise exercise;
  const displayExercise({ Key? key, required this.exercise}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(exercise.name),
      subtitle: Container(
        height: 250,
        child: ListView.builder(
          itemCount: exercise.content.length,
          itemBuilder: (context,index){
            
            return ListTile(  
              leading: RichText(
                text: TextSpan(text:"Set: "+ (index + 1).toString() + "    " + 
                                    "Reps: " +  exercise.content[index].reps.toString() + "    " + 
                                    "Weight: " + exercise.content[index].weight.toString()
                              ) 
              ),
            );
          })
      ),
    );
  }
}