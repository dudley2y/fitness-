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
  final name;
  final reps;

  Exercise({ this.name, this.reps });

}