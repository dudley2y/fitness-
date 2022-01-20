// ignore_for_file: dead_code

import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness/models/testSplit.dart';
import 'package:fitness/models/workout.dart';
import 'package:fitness/screens/home/homeFab/actionbutton.dart';
import 'package:fitness/screens/home/homeFabOptions/addExerciseSplit/addNewWorkout.dart';
import 'package:fitness/screens/home/todaysWorkout.dart/todaysWrapper.dart';
import 'package:fitness/services/authentication_service.dart';
import 'package:fitness/screens/home/homeFabOptions/editExerciseSplit/editWorkout.dart';  

import 'package:flutter/material.dart';
// ignore: implementation_imports
import 'package:provider/src/provider.dart';
import 'package:fitness/screens/home/homeFab/expandablefab.dart';
import 'package:fitness/services/database_service.dart';
import 'package:fitness/screens/home/globals.dart';
import 'package:fitness/screens/home/homeFabOptions/addExerciseSplit/nameNewSplit.dart';

class HomeRoute extends StatefulWidget {
  const HomeRoute({Key? key}) : super(key: key);


  @override
  State<StatefulWidget> createState() => _HomeRoute();
}

final tempWorkout = test().init();

class _HomeRoute extends State<HomeRoute> {
  void logout(BuildContext context) {
    context.read<AuthenticationService>().signOut();
  }

  int flag = 0;

  int getFlag() {
    return flag;
  }

  int _currDay = today;

  double _swipeDistance = 0; 

  @override
  Widget build(BuildContext context) {

    Workout _currWorkout = tempWorkout.getData(intToDay(_currDay));
  
    return Scaffold(
      backgroundColor: const Color(0xFFEDF6F9),
      floatingActionButton: ExpandableFab(distance: 112, children: [
        // sub buttons from main FAB
        ActionButton(
            icon: const Icon(Icons.add_circle_outlined),
            onPressed: () async {
              await Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AddNewWorkout(
                            metaList: dailyExcerciseMeta,
                            day: viewDay,
                          )));
              setState(() {});
            }),
        ActionButton(
          icon: const Icon(Icons.edit),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const EditWorkout()));
          },
        ),
        ActionButton(
          icon: const Icon(Icons.article_outlined),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => NameSplit()));
          },
        ),
        ActionButton(
          icon: Icon(Icons.logout),
          onPressed: (){
            context.read<AuthenticationService>().signOut();
          },
        )
      ]),
      body: 
        Padding( 
          padding: const EdgeInsets.only(top: 25, left: 20, right: 20),
          child: GestureDetector( 
              onHorizontalDragUpdate: (details) { 
                _swipeDistance += details.delta.dx;
              },

              onHorizontalDragEnd: (details){

                int sensitivty = 5;

                if(_swipeDistance > sensitivty){
                  setState(() {
                    _currDay--;
                    _currDay%=7;
                    _swipeDistance = 0;
                  });
                }
                // swipe left 
                if(_swipeDistance < -sensitivty){
                  setState(() {
                    _currDay++;
                    _currDay%=7;
                    _swipeDistance = 0;
                  });
                }
              },
              child: Column(
                children: [
                  FutureBuilder(
                    future:  DatabaseService(uid: context.read<User>().uid).getUserFirstName(),
                    builder: (BuildContext context, AsyncSnapshot<String> firstName ){
                      switch (firstName.connectionState) {
                        case (ConnectionState.none): return const Text("Hi");
                        case (ConnectionState.waiting): return const Text("Loading...");
                        case (ConnectionState.done):
                          if(firstName.hasData) return Text("Hi " + firstName.data!);
                          else return const Text("Maybe play league instead of gym today");
                        default: return const Text("Idek bud");
                      }
                    }
                  ),
                 
                  Container(  
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width ,
                    margin:  EdgeInsets.only(
                                left:  MediaQuery.of(context).size.width*(1/5),
                                right: MediaQuery.of(context).size.width*(1/5)),
                    height: 50,
                    decoration: const BoxDecoration(  
                                        borderRadius: BorderRadius.all(Radius.circular(28)),
                                        color: Color(0xff83C5BE),
                                ),
                    child: 
                      Center(   
                        child: Text( "${intToDay(_currDay)}'s workout", 
                                      style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w300)
                                    ),
                      )
                  ),
                  TodaysWrapper(todaysLifts: _currWorkout)
            ]
          ),
        ),
      )
    );
  }
}

/**
 * Next up: make each 'ExerciseWidget' clickable, so it expands, showing a description and allowing edits
 */
