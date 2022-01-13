import 'package:fitness/models/makeABetterName.dart';
import 'package:flutter/material.dart';

class displayExercise extends StatelessWidget {
  final Exercise exercise;
  const displayExercise({ Key? key, required this.exercise}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(exercise.name),
    );
  }
}