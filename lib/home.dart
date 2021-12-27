import 'package:fitness/actionbutton.dart';
import 'package:fitness/authentication_service.dart';
// import 'package:fitness/dynamiclist.dart';
import 'package:fitness/mywidgets.dart';
import 'package:flutter/material.dart';
// ignore: implementation_imports
import 'package:provider/src/provider.dart';
import 'package:intl/intl.dart';
import 'package:fitness/expandablefab.dart';
// import 'dart:math' as math;
class HomeRoute extends StatefulWidget{
  const HomeRoute({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomeRoute();
}

class _HomeRoute extends State<HomeRoute> {
  List<Widget> workoutList = [];
  FloatingActionButton fabMainButton = FloatingActionButton(onPressed: ()=>print('pressed main'));
 
void _showAction(BuildContext context, int i){
  print('you sent $i');
}
  ExpandableFab fab = ExpandableFab(
    distance: 112,
    children: [ // sub buttons from main FAB
      ActionButton(icon: Icon(Icons.add_circle_outlined),
      onPressed: () => print('+'),
      )
    ]
    );
  final TextEditingController eCtrl = TextEditingController();


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
      floatingActionButton: fab,
      body: Column(
        children: <Widget>[
          TextField(
            controller: eCtrl,
            onSubmitted: (text){
              if(text.isNotEmpty){
                workoutList.add(ExerciseWidget(title: eCtrl.text,desc: eCtrl.text));
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
