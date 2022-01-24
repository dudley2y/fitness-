import 'package:fitness/models/workoutDay.dart';

class Split { 
  final workoutDay monday;
  final workoutDay tuesday; 
  final workoutDay wensday; 
  final workoutDay thursday; 
  final workoutDay friday;
  final workoutDay saturday; 
  final workoutDay sunday;

  Split({
    required this.monday, 
    required this.tuesday, 
    required this.wensday,
    required  this.thursday,
    required this.friday, 
    required this. saturday, 
    required this.sunday
    });
    

    fromFutureSnapshot(Future futureSnapshot){
      return Split();
    }
}