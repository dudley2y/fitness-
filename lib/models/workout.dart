import 'package:fitness/models/makeABetterName.dart';

class Workout{ 
  late List <Exercise> workout; 

  void addworkout(Exercise currExercise){
    workout.add(currExercise);
  }
}