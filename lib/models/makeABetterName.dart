import 'package:json_annotation/json_annotation.dart';

class ExcerciseMeta {
  ExcerciseMeta(
      {required this.name, required this.set, required this.rep, notes, done});

  late String notes;
  late bool done;
  late ExerciseType type;
  String name, set, rep;
}

@JsonSerializable()
class Exercise {
  final ExerciseType type;
  String name;
  Exercise({required this.type, required this.name});
}

class ConstantRepExercise extends Exercise {
  final int sets, reps, weight;
  String name = '';

  ConstantRepExercise(
      {required this.name,
      required this.sets,
      required this.reps,
      required this.weight})
      : super(type: ExerciseType.creps, name: name);
}

class VariableRepExercise extends Exercise {
  List<int> reps = [];
  String name = '';

  VariableRepExercise({required this.name, required this.reps})
      : super(type: ExerciseType.vreps, name: name);
}

class TimedExercise extends Exercise {
  String name = '';
  String time = '';
  TimedExercise({required this.name, required this.time})
      : super(type: ExerciseType.timed, name: name);
}

// class CircutExercise extends Exercise {
//   int reps;
//   List<String> name = [];
//   List<String> times = [];
//   // String name;
//   CircutExercise(
//       {required this.reps, required this.name, required this.times})
//       : super(type: _ExerciseType.circut, name: name);
// }

enum ExerciseType {
  creps,
  vreps,
  timed,
  // circut,
}
