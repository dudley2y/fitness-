import 'package:fitness/authentication_service.dart';
import 'package:fitness/widgets.dart';
import 'package:flutter/material.dart';
// ignore: implementation_imports
import 'package:provider/src/provider.dart';
import 'package:intl/intl.dart';
import 'package:fitness/schedule.dart';

class HomeRoute extends StatelessWidget {
  List<Widget> workoutList = [];
  HomeRoute({Key? key}) : super(key: key);

  ElevatedButton addWorkoutButton = ElevatedButton(
    onPressed: () {},
    child: const Text('1'),
  );

  void logout(BuildContext context) {
    context.read<AuthenticationService>().signOut();
  }

  String getDay() {
    return DateFormat('EEEE').format(DateTime.now());
  }

  @override
  Widget build(BuildContext context) {
    addWorkoutButton = ElevatedButton(
        onPressed: () {
          workoutList.add(const Text('sup'));
          (context as Element).reassemble();
        },
        child: const Text('HALLO'));
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Schedule for ${getDay()}'),
          ),
          body: SafeArea(
              child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 0.0, vertical: 32.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Scrollbar(
                          child: Column(
                              children: [...workoutList])), //try animated list
                      addWorkoutButton,
                    ],
                  )))),
    );
  }
}
/**
 * notes set size on container to prevent overflow, this will cause scrolling
 * 
 */