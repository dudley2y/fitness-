import 'package:fitness/models/makeABetterName.dart';
import 'package:fitness/screens/home/globals.dart';

class workoutDay{ 
  
  List<Exercise> exercises = [];

  workoutDay(Map<String,dynamic> day){
    for(var i in day.keys){
      String name = day[i]['name'];
      ExerciseType type = strToEnum(day[i]['type']);
      switch(type){
        case ExerciseType.creps:
          int reps = day[i]['reps'];
          int sets = day[i]['sets'];
          int weight = -1;
          exercises.add(ConstantRepExercise(name:name,sets: sets,reps: reps,weight: weight));
        break;
        case ExerciseType.timed:
          print('case timed');
          String time = day[i]['time'];
          exercises.add(TimedExercise(name:name,time: time));
        break;
        case ExerciseType.vreps:
          List<int> reps = List.from(day[i]['reps']);
          // List<int> reps = [];
          // for(var i in _reps){
            // reps.add(i);
          // }
          exercises.add(VariableRepExercise(name:name,reps:reps));
        break;
      }
    }
  }

}