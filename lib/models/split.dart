import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitness/models/workoutDay.dart';

class Split { 
  final workoutDay monday;
  final workoutDay tuesday; 
  final workoutDay wednesday; 
  final workoutDay thursday; 
  final workoutDay friday;
  final workoutDay saturday; 
  final workoutDay sunday;

  ///returns the day specified by the day, 
  /// sunday    - 0
  /// monday    - 1
  /// tuesday   - 2
  /// wednesday - 3
  /// thursday  - 4
  /// friday    - 5
  /// saturday  - 6

  operator [](int day){
    switch(day){
      case 0: 
        return sunday;
      case 1:
        return monday;
      case 2:
        return tuesday;
      case 3:
        return wednesday;
      case 4:
        return thursday;
      case 5:
        return friday;
      case 6:
        return saturday;
    }
    throw Error();
  }

  Split({
    required this.monday, 
    required this.tuesday, 
    required this.wednesday,//josh you fuckin idot
    required  this.thursday,
    required this.friday, 
    required this. saturday, 
    required this.sunday
    });
    
    /** maybe make a constructor to do this? idk how to make multiple contructor overloads */
    static fromSnapshot(QueryDocumentSnapshot<Object?>? snapshot){
      // List<workoutDay> days = [workoutDay(),workoutDay(),workoutDay(),workoutDay(),workoutDay(),workoutDay(),workoutDay()];
      var snapMap = snapshot!.data() as Map;
      return Split(monday: workoutDay(snapMap['Monday']),
        tuesday: workoutDay(snapMap['Tuesday']),
        wednesday: workoutDay(snapMap['Wednesday']),
        thursday: workoutDay(snapMap['Thursday']),
        friday: workoutDay(snapMap['Friday']),
        saturday: workoutDay(snapMap['Saturday']),
        sunday: workoutDay(snapMap['Sunday'])
        );
    }
}