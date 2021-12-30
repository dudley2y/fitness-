
import 'package:fitness/screens/authenticationWrapper.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fitness/services/authentication_service.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
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
            create: (context) =>
                context.read<AuthenticationService>().user,
            initialData: null,
          ),
        ],
        child: const MaterialApp(
          home: AuthenticationWrapper(),
          title: "Welcome!",
        ));
  }
}
