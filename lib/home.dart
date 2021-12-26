import 'package:fitness/authentication_service.dart';
import 'package:fitness/dynamiclist.dart';
import 'package:fitness/mywidgets.dart';
import 'package:flutter/material.dart';
// ignore: implementation_imports
import 'package:provider/src/provider.dart';
import 'package:intl/intl.dart';
import 'package:fitness/schedule.dart';

class HomeRoute extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => new _HomeRoute();
}

class _HomeRoute extends State<HomeRoute> {
  List<Widget> workoutList = [];
  final TextEditingController eCtrl = new TextEditingController();


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
    return Scaffold(
      appBar: AppBar(title : Text('Schedule for ${getDay()}')),
      body: new Column(
        children: <Widget>[
          TextField(
            controller: eCtrl,
            onSubmitted: (text){
              if(text.length > 0){
                workoutList.add(new ExerciseWidget(title: eCtrl.text,desc: eCtrl.text));
                eCtrl.clear();
                setState(() {});
              }
            },
          ),
          Expanded(
            child:ListView.builder(
              itemCount: workoutList.length,
              itemBuilder: (BuildContext context,int indx){
                return workoutList[indx];
              },
            )
          ),
          // ExerciseWidget(title:eCtrl.text,desc: eCtrl.text ),
        ],
      )
    );
    }}