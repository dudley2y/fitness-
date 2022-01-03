
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitness/models/makeABetterName.dart';
import 'package:fitness/models/split.dart';
import 'package:fitness/models/workoutDay.dart';

class DatabaseService {

  final uid;


  DatabaseService({this.uid});


  final CollectionReference users_ref = FirebaseFirestore.instance.collection('users');
  final CollectionReference users_splits_ref = FirebaseFirestore.instance.collection('users_splits');
  final CollectionReference users_splits_names_ref = FirebaseFirestore.instance.collection('users_splits_names');

  Future <void> initUser (String firstName, String lastName) async {
    
    final usersRef = users_ref.doc(uid);

    usersRef.set(
      {
      "first_name": firstName, 
      "last_name":  lastName
      }
    );
  }

  Future<QuerySnapshot<Map<String, dynamic>>> getUserSplits() async {
    return users_splits_names_ref.doc(uid).collection("names").get();
  }

  workoutDay convertJsonDayToDay(Map<String, dynamic> jsonDay){

    workoutDay today = workoutDay();

    for(var exercise in jsonDay.keys){
      ExerciseSets currExercise = ExerciseSets(name: exercise);
      for(var thing in jsonDay[exercise]){
        currExercise.addSet(thing["weight"], thing["reps"]);
      }
      today.addworkout(currExercise);
    }

    return today;
  }


  Split convertJsonToSplit(Map<String, dynamic> jsonData){

    Split currSplit = Split();

    for (var day in jsonData.keys) {
      workoutDay today = convertJsonDayToDay(jsonData[day]);
      currSplit.addDay(day, today);
    }

    return currSplit;
  }
  

  Future<Split> getUserWorkoutGivenName(String split) async {
    final users_splits = await users_splits_ref.doc(uid).get();
    Map<String, dynamic> users_splits_data = users_splits.data() as Map<String,dynamic>;
    return convertJsonToSplit(users_splits_data[split]);
  }
}