import 'package:json_annotation/json_annotation.dart';

class ExcerciseMeta {
  ExcerciseMeta(
      {required this.name, required this.set, required this.rep, notes, done});

  late String notes;
  late bool done;
  late ExerciseType type;
  String name, set, rep;
}

// @JsonSerializable()
abstract class Exercise {
  final ExerciseType type;
  String name;
  Exercise({required this.type, required this.name});

  Map toMap() {
    return {};
  }
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
  @override
  Map toMap() {
    Map foo = {};
    foo['type'] = 'constant';
    foo['name'] = name;
    foo['reps'] = reps;
    foo['sets'] = sets;

    return foo;
  }
}

class VariableRepExercise extends Exercise {
  List<int> reps = [];
  String name = '';

  VariableRepExercise({required this.name, required this.reps})
      : super(type: ExerciseType.vreps, name: name);

  Map toMap() {
    Map foo = {};
    foo['type'] = 'variable';
    foo['name'] = name;
    foo['reps'] = reps;
    foo['sets'] = reps.length;

    return foo;
  }
}

class TimedExercise extends Exercise {
  String name = '';
  String time = '';
  TimedExercise({required this.name, required this.time})
      : super(type: ExerciseType.timed, name: name);
  Map toMap() {
    Map foo = {};
    foo['type'] = 'timed';
    foo['name'] = name;
    foo['reps'] = -1;
    foo['sets'] = -1;
    foo['time'] = time;

    return foo;
  }
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


/// @breif converts a string to the appropriate ExerciseType
/// @param str a string, case agnostic
/// @returns the ExerciseType found to correspong with the string
/// @throws Error when no conversion is found
/// supported conversions are
///   'constant' -> ExerciseType.creps
///   'creps'    -> ExerciseType.creps
///   'timed'    -> ExerciseType.timed
///   'time'     -> ExerciseType.timed
///   'variable' -> ExerciseType.vreps
///   'vreps'    -> ExerciseType.vreps
ExerciseType strToEnum(String str){
  str = str.toLowerCase();
  switch(str){
    case 'constant':
      return ExerciseType.creps;
    case 'creps':
      return ExerciseType.creps;
    case 'timed':
      return ExerciseType.timed;
    case 'time':
      return ExerciseType.timed;
    case 'variable':
      return ExerciseType.vreps;
    case 'vreps':
      return ExerciseType.vreps;
  }
  throw Error();
}
