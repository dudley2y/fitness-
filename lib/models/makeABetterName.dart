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
  List<RepsAndWeight> content = List<RepsAndWeight>.empty(growable: true);
  String name;

  Exercise({required this.name});

  void addSet(reps, weight){
    content.add(
      RepsAndWeight(reps: reps, weight: weight)
    );
  }
}