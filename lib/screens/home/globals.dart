import 'package:fitness/models/makeABetterName.dart';
import 'package:intl/intl.dart';

String getDay() {
  return DateFormat('EEEE').format(DateTime.now());
}

int dayToInt(String day) {
  switch (day) {
    case 'Sunday':
      return 0;
    case 'Monday':
      return 1;
    case 'Tuesday':
      return 2;
    case 'Wednesday':
      return 3;
    case 'Thursday':
      return 4;
    case 'Friday':
      return 5;
    case 'Saturday':
      return 6;
    default:
      return -1;
  }
}

String intToDay(int day){
    switch (day) {
    case 0:
      return 'Sunday';
    case 1:
      return 'Monday';
    case 2:
      return 'Tuesday';
    case 3:
      return 'Wednesday';
    case 4:
      return 'Thursday';
    case 5:
      return 'Friday';
    case 6:
      return 'Saturday';
    default:
      return '';
  }

}

List<ExcerciseMeta> excerciseMeta = [];
List<List<ExcerciseMeta>> dailyExcerciseMeta = [[], [], [], [], [], [], []];// one entry per day
final String todayString = getDay();
final int today = dayToInt(todayString);
int viewDay =
    today; // today is today, viewDay is the day((of the week) the user is looking at rn

/**
 * maybe there is a better way to pass data across pages, but this was the easiest
 * 
 * 
 */