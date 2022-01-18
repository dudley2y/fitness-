import 'package:flutter/material.dart';
import 'package:fitness/screens/home/homeFab/expandablefab.dart';
import 'package:fitness/models/makeABetterName.dart';

class ExerciseWidget extends StatefulWidget {
  // String title, desc;
  Exercise exercise;
  bool done = false;
  ExerciseWidget({Key? key, required this.exercise}) : super(key: key);
  @override
  State<ExerciseWidget> createState() {
    switch (exercise.type) {
      case ExerciseType.creps:
        return ConstantRepExerciseWidget();
        break;
      case ExerciseType.vreps:
        return VariableRepExerciseWidget();
        break;
      case ExerciseType.timed:
        return TimedExerciseWidget();
        break;
    }
  }
  // State<ExerciseWidget> createState() => _ExerciseWidgetCreator();
}

// class ExerciseWidgetCreator extends State<ExerciseWidget> {
//   @override
//   Widget build(BuildContext context) {
//     // switch (widget.exercise.type) {
//     //   case ExerciseType.creps:
//     //     _ConstantRepExerciseWidget();
//     //   case ExerciseType.vreps:
//     //     return _VariableRepExerciseWidget();
//     //   case ExerciseType.timed:
//     //     return _TimedExerciseWidget();
//     // }
//   }
// }
Color getColor(Set<MaterialState> states) {
  const Set<MaterialState> interactiveStates = <MaterialState>{
    MaterialState.pressed,
    MaterialState.hovered,
    MaterialState.focused,
  };
  if (states.any(interactiveStates.contains)) {
    return Colors.blue;
  }
  return Colors.red;
}

class VariableRepExerciseWidget extends State<ExerciseWidget> {
  @override
  Widget build(BuildContext context) {
    VariableRepExercise vre = widget.exercise as VariableRepExercise;

    return Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 5.0),
        decoration: BoxDecoration(
            color: Colors.blue[200], borderRadius: BorderRadius.circular(20)),
        child: Column(children: [
          Text(
            vre.name,
            style: const TextStyle(height: 1.5),
          ),
          Text(
            vre.reps.toString(),
            style: const TextStyle(height: 1.5),
          ),
          Checkbox(
            checkColor: Colors.white,
            fillColor: MaterialStateProperty.resolveWith(getColor),
            value: widget.done,
            onChanged: (bool? value) {
              setState(() {
                widget.done = !widget.done;
              });
            },
          )
        ]));
  }
}

class TimedExerciseWidget extends State<ExerciseWidget> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    TimedExercise te = widget.exercise as TimedExercise;
    return Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 5.0),
        decoration: BoxDecoration(
            color: Colors.blue[200], borderRadius: BorderRadius.circular(20)),
        child: Column(children: [
          Text(
            te.name,
            style: const TextStyle(height: 1.5),
          ),
          Text(
            te.time,
            style: const TextStyle(height: 1.5),
          ),
          Checkbox(
            checkColor: Colors.white,
            fillColor: MaterialStateProperty.resolveWith(getColor),
            value: widget.done,
            onChanged: (bool? value) {
              setState(() {
                widget.done = !widget.done;
              });
            },
          )
        ]));
  }
}

class ConstantRepExerciseWidget extends State<ExerciseWidget> {
  late bool done;
  // ExerciseWidget({Key? key, required this.title, required this.desc})
  //     : super(key: key);
  @override
  Widget build(BuildContext context) {
    // String title;
    // String desc;
    ConstantRepExercise cre = widget.exercise as ConstantRepExercise;
    return Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 5.0),
        decoration: BoxDecoration(
            color: Colors.blue[200], borderRadius: BorderRadius.circular(20)),
        child: Column(children: [
          Text(
            cre.name,
            style: const TextStyle(height: 1.5),
          ),
          Text(
            '${cre.sets} x ${cre.reps} @ ${cre.weight} lbs',
            style: const TextStyle(height: 1.5),
          ),
          Checkbox(
            checkColor: Colors.white,
            fillColor: MaterialStateProperty.resolveWith(getColor),
            value: widget.done,
            onChanged: (bool? value) {
              setState(() {
                widget.done = !widget.done;
              });
            },
          )
        ]));
  }
}
