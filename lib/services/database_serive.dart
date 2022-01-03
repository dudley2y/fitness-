import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final uid;
  DatabaseService({this.uid});

  final CollectionReference users_ref =
      FirebaseFirestore.instance.collection('users');
  final CollectionReference users_splits_ref =
      FirebaseFirestore.instance.collection('users_splits');
  final CollectionReference users_splits_names_ref =
      FirebaseFirestore.instance.collection('users_splits_names');

  Future<void> initUser(String firstName, String lastName) async {
    final usersRef = users_ref.doc(uid);

    usersRef.set({"first_name": firstName, "last_name": lastName});
  }

  Future<QuerySnapshot<Map<String, dynamic>>> getUserSplitNames() async {
    return users_splits_names_ref.doc(uid).collection("names").get();
  }
  
  Future<QuerySnapshot<Map<String, dynamic>>> getUserSplits(String name) async {
    // print(users_splits_ref.doc(uid).collection('ppl').get().);
    return users_splits_ref.doc(uid).collection(name).get();
  }
}
