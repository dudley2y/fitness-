import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fitness/authentication_service.dart';
import 'package:fitness/signup.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'SecondRoute.dart';

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
          )
      ],
      child: MaterialApp(
        title: 'My Fitness App',
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Welcome to My Fitness App'),
          ),
          body: const Center(
            child: AuthenticationWrapper()
          ),
        ),
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

    final firebaseUser = context.watch<User?>();

    if( firebaseUser != null){
      return SecondRoute(name: "Bob");
    }
    return(
      signupForm()
    );
  }
}
