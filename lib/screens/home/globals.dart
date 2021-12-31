import 'package:fitness/models/makeABetterName.dart';
import 'package:intl/intl.dart';

String getDay() {
  return DateFormat('EEEE').format(DateTime.now());
}

int strToDayOfWeek(String day) {
  switch (day) {
    case 'Sunday':
      return 0;
    case 'Monday':
      return 1;
    case 'Tuesday':
      return 5;
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

List<ExcerciseMeta> excerciseMeta = [];
List<List<ExcerciseMeta>> dailyExcerciseMeta = [[], [], [], [], [], [], []];
final String todayString = getDay();
final int today = strToDayOfWeek(todayString);
int viewDay =
    today; // today is today, viewDay is the day((of the week) the user is looking at rn

/**
 * maybe there is a better way to pass data across pages, but this was the easiest
 * 
 * 
 */