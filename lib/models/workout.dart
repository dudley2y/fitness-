import 'package:fitness/models/makeABetterName.dart';

class Workout{ 
  late List <Exercise> workout = List <Exercise>.empty(growable: true); 

  void addworkout(Exercise currExercise){
    workout.add(currExercise);
  }
}