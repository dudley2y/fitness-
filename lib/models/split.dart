import 'package:fitness/models/workout.dart';

class Split { 
  late Workout monday = Workout();
  late Workout tuesday = Workout(); 
  late Workout wensday = Workout(); 
  late Workout thursday = Workout(); 
  late Workout friday = Workout();
  late Workout saturday = Workout(); 
  late Workout sunday = Workout();

  void addDay(String day, Workout dayContent){
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

  Workout getData(String day){
    switch(day){
      case "Monday": 
        return monday;
      case "Tuesday": 
        return tuesday;
      case "Wensday": 
        return wensday;
      case "Thursday": 
        return thursday;
      case "Friday": 
        return friday;
      case "Satuday": 
        return saturday;
      case "Sunday": 
        return sunday;
      default: 
        return Workout(); 
    }
  }
}