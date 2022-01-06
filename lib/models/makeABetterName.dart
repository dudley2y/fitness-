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

class RepsAndWeight{
  final reps; 
  final weight;

  RepsAndWeight({ this.reps , this.weight});
}

class Exercise{ 
  late List<RepsAndWeight> content; 
  String name;

  Exercise({required this.name});

  void addSet(weight, reps){
    content.add(
      RepsAndWeight(reps: reps, weight: weight)
    );
  }
}