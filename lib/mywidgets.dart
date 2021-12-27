import 'package:flutter/material.dart';
import 'package:fitness/expandablefab.dart';

class ExerciseWidget extends StatefulWidget {
  String title, desc;
  bool done = false;
  ExerciseWidget({Key? key, required this.title, required this.desc})
      : super(key: key);
  @override
  State<ExerciseWidget> createState() => _ExerciseWidget();
}

class _ExerciseWidget extends State<ExerciseWidget> {
  late bool done;
  // ExerciseWidget({Key? key, required this.title, required this.desc})
  //     : super(key: key);
  @override
  Widget build(BuildContext context) {
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

    // String title;
    // String desc;
    return Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 5.0),
        decoration: BoxDecoration(
            color: Colors.blue[200], borderRadius: BorderRadius.circular(20)),
        child: Column(children: [
          Text(
            widget.title,
            style: const TextStyle(height: 1.5),
          ),
          Text(
            widget.desc,
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
