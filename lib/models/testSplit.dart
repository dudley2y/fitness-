
import 'package:fitness/models/makeABetterName.dart';
import 'package:fitness/models/split.dart';
import 'package:fitness/models/workout.dart';

class test{ 

  final Split temp = Split();


  void init(){

    final Workout monday = Workout();

    final Exercise BS = Exercise(name: "Back Squat");

    BS.addSet(8, 135);
    BS.addSet(6, 185);
    BS.addSet(4, 225);
    BS.addSet(4, 245);
    BS.addSet(2, 275);

    final Exercise PS = Exercise(name: "Pin Squat");

    PS.addSet(8, 135);
    PS.addSet(6, 185);
    PS.addSet(4, 225);
    PS.addSet(4, 245);
    PS.addSet(2, 275);

    final Exercise BBP = Exercise(name: "Barbell Bench Press");

    BBP.addSet(8, 135);
    BBP.addSet(6, 185);
    BBP.addSet(4, 225);
    BBP.addSet(4, 245);
    BBP.addSet(2, 275);

    monday.addworkout(BS);
    monday.addworkout(PS);
    monday.addworkout(BBP);

    temp.monday = monday;

    // Tuesday

    final Workout tuesday = Workout();

    final Exercise DL = Exercise(name: "Deadlift");

    DL.addSet(8, 135);
    DL.addSet(6, 185);
    DL.addSet(4, 225);
    DL.addSet(4, 245);
    DL.addSet(2, 275);

    final Exercise PF  = Exercise(name: "Pec Flye");

    PF.addSet(8, 135);
    PF.addSet(6, 185);
    PF.addSet(4, 225);
    PF.addSet(4, 245);
    PF.addSet(2, 275);

    final Exercise BOP = Exercise(name: "Barbell Overhead Press");

    BOP.addSet(8, 135);
    BOP.addSet(6, 185);
    BOP.addSet(4, 225);
    BOP.addSet(4, 245);
    BOP.addSet(2, 275);

    tuesday.addworkout(DL);
    tuesday.addworkout(PF);
    tuesday.addworkout(BOP);

    temp.tuesday = tuesday;

    // Wens Nothing 

    // Thursday 

    final Workout thursday = Workout();

    final Exercise CU = Exercise(name: "Chin up");

    CU.addSet(8, 135);
    CU.addSet(6, 185);
    CU.addSet(4, 225);
    CU.addSet(4, 245);
    CU.addSet(2, 275);

    final Exercise CRF = Exercise(name: "Cable reverse flye");

    CRF.addSet(8, 135);
    CRF.addSet(6, 185);
    CRF.addSet(4, 225);
    CRF.addSet(4, 245);
    CRF.addSet(2, 275);

    thursday.addworkout(CU);
    thursday.addworkout(CRF);

    temp.thursday = thursday;

    // Friday 

    final Workout friday = Workout();

    final Exercise IDB = Exercise(name: "Incline Dumbell Press");

    IDB.addSet(8, 135);
    IDB.addSet(6, 185);
    IDB.addSet(4, 225);
    IDB.addSet(4, 245);
    IDB.addSet(2, 275);

    friday.addworkout(IDB);


    temp.friday = friday;


    // Saturday 

    final Workout saturday = Workout();

    final Exercise CL = Exercise(name: "Curl");

    CL.addSet(8, 135);
    CL.addSet(6, 185);
    CL.addSet(4, 225);
    CL.addSet(4, 245);
    CL.addSet(2, 275);

    final Exercise PSG = Exercise(name: "Plate Shrug");

    PSG.addSet(8, 135);
    PSG.addSet(6, 185);
    PSG.addSet(4, 225);
    PSG.addSet(4, 245);
    PSG.addSet(2, 275);

    saturday.addworkout(CL);
    saturday.addworkout(PSG);

    temp.saturday = saturday;

    // Sunday off
  }
}