// import 'dart:js';
// import 'package:flutter/material.dart';

// /// The base class for the different types of items the list can contain.
// abstract class WorkoutSchedule {
//   /// The title line to show in a list item.
//   Widget buildTitle(BuildContext context);

//   /// The subtitle line, if any, to show in a list item.
//   Widget buildSubtitle(BuildContext context);
// }

// /// A ListItem that contains data to display a heading.
// class Workout implements WorkoutSchedule {
//   final String heading;

//   Workout(this.heading);

//   @override
//   Widget buildTitle(BuildContext context) {
//     return Text(
//       heading,
//       style: Theme.of(context).textTheme.headline5,
//     );
//   }

//   @override
//   Widget buildSubtitle(BuildContext context) => const SizedBox.shrink();
// }

// /// A ListItem that contains data to display a message.
// class MessageItem implements WorkoutSchedule {
//   final String sender;
//   final String body;

//   MessageItem(this.sender, this.body);

//   @override
//   Widget buildTitle(BuildContext context) => Text(sender);

//   @override
//   Widget buildSubtitle(BuildContext context) => Text(body);
// }

// class Schedule extends StatelessWidget{
//   const Schedule({Key? key}) : super(key: key);
//     @override
//   Widget build(BuildContext context){
//     return( 
//       null
//     )
//   }
// }