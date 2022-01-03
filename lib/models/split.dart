import 'package:fitness/models/workoutDay.dart';

class Split { 
  late workoutDay monday;
  late workoutDay tuesday; 
  late workoutDay wensday; 
  late workoutDay thursday; 
  late workoutDay friday;
  late workoutDay saturday; 
  late workoutDay sunday;

  void addDay(String day, workoutDay dayContent){
    switch(day){
      case "Monday": 
        monday = dayContent;
        return;
      case "Tuesday": 
        tuesday = dayContent;
        return;
      case "Wensday": 
        wensday = dayContent;
        return;
      case "Thursday": 
        thursday = dayContent;
        return;
      case "Friday": 
        friday = dayContent;
        return;
      case "Satuday": 
        saturday = dayContent;
        return;
      case "Sunday": 
        sunday = dayContent;
        return;
    }
  }
}