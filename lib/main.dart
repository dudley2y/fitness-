import 'dart:js';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fitness/authentication_service.dart';
import 'package:fitness/signup.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'home.dart';
import 'login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthenticationService>(
          create: (_) => AuthenticationService(FirebaseAuth.instance)
          ),
        StreamProvider(
          create: (context) => context.read<AuthenticationService>().authStateChanges,
          initialData: null,
          ),
      ],
      child: const MaterialApp(
        home: AuthenticationWrapper(),
      )
    );
  }
}

class AuthenticationWrapper extends StatefulWidget {
  const AuthenticationWrapper({ Key? key}) : super(key: key);

  @override
  _AuthenticationWrapperState createState() => _AuthenticationWrapperState();
}

class _AuthenticationWrapperState extends State<AuthenticationWrapper> {
  @override
  Widget build(BuildContext context) {

    User? firebaseUser = context.watch<User?>();

    if( firebaseUser != null){
      return const HomeRoute();
    }
    else{
      return const LoginForm();
    }
  }
}


/* 

1. user to set workouts 
2. user to be able to hold differnt workouts 
  aka. 
    plan a, (push, pull legs); 
    plan b, (upper, lower);

... analysis and graphs 
  progress? 
  */

