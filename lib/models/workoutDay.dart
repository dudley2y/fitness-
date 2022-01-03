import 'package:fitness/models/makeABetterName.dart';

class workoutDay{ 
  late List <ExerciseSets> workout; 

  void addworkout(ExerciseSets currExercise){
    workout.add(currExercise);
  }
}