import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitness/screens/home/homeFabOptions/editExerciseSplit/editedWorkout.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fitness/services/database_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DisplaySplits extends StatelessWidget {
  const DisplaySplits({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: DatabaseService(uid: context.read<User?>()!.uid)
            .getUserSplits(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Text("Something went wrong");
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text("Loading");
          }

          return ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              return ListTile(
                title: Text(document.id),
                onTap: () {
                  print(document.id);
                   Navigator.push(context,
                    MaterialPageRoute(builder: (context) => EditedWorkout(workoutName: document.id)));
                },
              );
            }).toList(),
            shrinkWrap: true,
          );
        });
  }
}
