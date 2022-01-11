import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness/screens/authenticate/authDecider.dart';
import 'package:fitness/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthenticationWrapper extends StatefulWidget {
  const AuthenticationWrapper({Key? key}) : super(key: key);

  @override
  _AuthenticationWrapperState createState() => _AuthenticationWrapperState();
}



class _AuthenticationWrapperState extends State<AuthenticationWrapper> {

  @override
  Widget build(BuildContext context) {
    
    User? firebaseUser = context.watch<User?>();

    if (firebaseUser != null) {
      return const HomeRoute();
    } else {
      return const AuthDecider();
    }
  }
}