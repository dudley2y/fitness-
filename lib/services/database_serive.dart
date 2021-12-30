
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {

  final uid;

  DatabaseService({this.uid});


  final CollectionReference users_ref = FirebaseFirestore.instance.collection('users');
  final CollectionReference user_splits_ref = FirebaseFirestore.instance.collection('user_splits');

  Future <void> initUser (String firstName, String lastName) async {
    
    final usersRef = users_ref.doc(uid);

    usersRef.set(
      {
      "first_name": firstName, 
      "last_name":  lastName
      }
    );
  }
  
}