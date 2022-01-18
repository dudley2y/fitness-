import 'package:fitness/models/makeABetterName.dart';
import 'package:intl/intl.dart';
import 'dart:developer';

String getDay() {
  return DateFormat('EEEE').format(DateTime.now());
}

int dayToInt(String day) {
  day = day.toLowerCase();
  switch (day) {
    case 'sunday':
      return 0;
    case 'monday':
      return 1;
    case 'tuesday':
      return 2;
    case 'wednesday':
      return 3;
    case 'thursday':
      return 4;
    case 'friday':
      return 5;
    case 'saturday':
      return 6;
    case 'wensday':
      return 3;

    default:
      return -1;
  }
}

String intToDay(int day) {
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
    case -1:
      return 'Today';
    default:
      return '';
  }
}

List<Exercise> excercises = [];
List<List<Exercise>> dailyExcercises = [
  [],
  [],
  [],
  [],
  [],
  [],
  []
]; // one entry per day
final String todayString = getDay();
final int today = dayToInt(todayString);
int viewDay =
    today; // today is today, viewDay is the day((of the week) the user is looking at rn
bool flag2 = false; // bad idea, but eh

enum _ExerciseType {
  creps,
  vreps,
  timed,
  circut,
}

/**
 * maybe there is a better way to pass data across pages, but this was the easiest
 * 
 * 
 */