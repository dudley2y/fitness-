import 'dart:ui';

import 'package:fitness/screens/home/homeFab/actionbutton.dart';
import 'package:fitness/screens/home/homeFabOptions/addExerciseSplit/addNewWorkout.dart';
import 'package:fitness/services/authentication_service.dart';
import 'package:fitness/screens/home/homeFabOptions/editExerciseSplit/editWorkout.dart';
import 'package:firebase_auth/firebase_auth.dart';

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

class _HomeRoute extends State<HomeRoute> {
  void logout(BuildContext context) {
    context.read<AuthenticationService>().signOut();
  }

  int flag = 0;

  int getFlag() {
    return flag;
  }

  int _currDay = today;

  @override
  Widget build(BuildContext context) {

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
        )
      ]),
      body: 
        Padding( 
          padding: const EdgeInsets.only(top: 25, left: 20, right: 20),
          child: Container( 
              child: Column(
                children: [
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
                    child: Row(  
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                         Padding(
                              padding: const  EdgeInsets.only(right: 15),
                              child: 
                              ActionButton(
                                icon: const Icon(Icons.arrow_left_sharp),
                                onPressed: () => setState(() {
                                                 _currDay--;
                                                  _currDay%=7;
                                                  }
                                                )
                                )
                              ),
                              Text(
                                "${intToDay(_currDay)}'s workout", 
                                style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w300),

                              ),
                              Padding(
                                padding: const  EdgeInsets.only(left: 15),
                                child: ActionButton(
                                        
                                        icon: const Icon(Icons.arrow_right_sharp),
                                        onPressed: () {
                                          setState(() {
                                            _currDay++;
                                            _currDay%=7;
                                          });
                                        }
                                  )
                              ),
                      ],
                    ),
                  ),
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
