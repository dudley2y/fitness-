import 'package:fitness/authentication_service.dart';
import 'package:fitness/widgets.dart';
import 'package:flutter/material.dart';
// ignore: implementation_imports
import 'package:provider/src/provider.dart';

class HomeRoute extends StatelessWidget {
  const HomeRoute({Key? key}) : super(key: key);
  void logout(BuildContext context) {
    context.read<AuthenticationService>().signOut();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text(
                'Welcome to My Fitness App but you are logged in now!'),
          ),
          body: SafeArea(
              child: Container(
                  width: double.infinity,
                  padding:
                      EdgeInsets.symmetric(horizontal: 0.0, vertical: 32.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text("Welcome to my App, "),
                      ElevatedButton(
                          onPressed: () {
                            logout(context);
                          },
                          child: const Text("Log out")),
                      Container(child: WorkoutWidget()),
                    ],
                  )))),
    );
  }
}
/**
 * child: Column(
              children: [
                
                WorkoutWidget(title: 'hello', desc: 'world'),
              ],
            ),
 */