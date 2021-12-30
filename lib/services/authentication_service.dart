import 'dart:js';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';


class AuthenticationService{
  final FirebaseAuth _firebaseAuth;

  AuthenticationService(this._firebaseAuth);

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  Future <void> initUser (String firstName, String lastName) async {
    _firebaseAuth.authStateChanges().listen((User? user) {
      if (user != null) {

        final usersRef = FirebaseFirestore.instance.collection('users').doc(user.uid);

        usersRef.get().then((DocumentSnapshot documentSnapshot){
          if(!documentSnapshot.exists){
            usersRef.set(
              {
              "first_name": firstName, 
              "last_name":  lastName
              }
            );
          }
        });
      }
    });
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  Future<String?> signIn({required String email, required String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      return "Signed in";
    } on FirebaseAuthException catch (e) {
      //print(e.message);
      return e.message;
    }
  }

  Future<String?> signUp({required String email, required String password}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      return "Signed up";
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }
}