import 'package:json_annotation/json_annotation.dart';

class ExcerciseMeta {
  ExcerciseMeta(
      {required this.name, required this.set, required this.rep, notes, done});

  late String notes;
  late bool done;
  late _ExerciseType type;
  String name, set, rep;
}

@JsonSerializable()
class Exercise {
  final _ExerciseType type;
  Exercise({required this.type});
}

class ConstantRepExercise extends Exercise {
  final int sets, reps;
  ConstantRepExercise({required this.sets, required this.reps, type})
      : super(type: type);
}

class VariableRepExercise extends Exercise {
  List<int> reps = [];
  VariableRepExercise({required this.reps, type}) : super(type: type);
}

class TimedExercise extends Exercise {
  List<String> workoutName = [];
  List<String> times = [];
  TimedExercise({required this.workoutName, required this.times, type})
      : super(type: type);
}

class CircutExercise extends Exercise {
  int reps;
  List<String> workoutName = [];
  List<String> times = [];
  CircutExercise(
      {required this.reps,
      required this.workoutName,
      required this.times,
      type})
      : super(type: type);
}

enum _ExerciseType {
  creps,
  vreps,
  timed,
  circut,
}
