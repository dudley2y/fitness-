import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness/services/database_service.dart';

class AuthenticationService{
  final FirebaseAuth _firebaseAuth;

  AuthenticationService(this._firebaseAuth);

  Stream<User?> get user =>  _firebaseAuth.authStateChanges();


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

  Future<String?> signUp({required String email, required String password, required first, required last}) async {
    try {
      UserCredential result = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      await DatabaseService(uid: result.user!.uid).initUser(first, last);
      return "Signed up";
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }
}