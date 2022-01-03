class ExcerciseMeta{

  ExcerciseMeta(
    {
      required this.name,
      required this.set,
      required this.rep,
      notes,
      done
    });

  late String notes;
  late bool done;
  String name,set,rep;
}

class Exercise{ 
  final reps;
  final weights;

  Exercise({ this.weights, this.reps });
}

class ExerciseSets{ 
  late List<Exercise> content; 
  String name;

  ExerciseSets({required this.name});

  void addSet(weight, reps){
    content.add(
      Exercise(weights: weight, reps: reps)
    );
  }
}