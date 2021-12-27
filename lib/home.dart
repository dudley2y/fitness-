import 'package:fitness/actionbutton.dart';
import 'package:fitness/addNewWorkout.dart';
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
  
  void logout(BuildContext context) {
    context.read<AuthenticationService>().signOut();
  }

  String getDay() {
    return DateFormat('EEEE').format(DateTime.now());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title : Text('Schedule for ${getDay()}')),
      floatingActionButton: ExpandableFab(
        distance: 112,
        children: [ // sub buttons from main FAB
          ActionButton(
            icon: const Icon(Icons.add_circle_outlined),
            onPressed: () => Navigator.push( 
                              context, 
                              MaterialPageRoute(
                                builder: (context) => const AddNewWorkout()
                              )
                            )
          ),
          ActionButton(
            icon: const Icon(Icons.edit),
            onPressed: (){} ,  
          )
        ]
      ),
      body: Text("Nothing here, plz add workout")
     );
    }}
