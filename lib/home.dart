import 'package:fitness/authentication_service.dart';
import 'package:flutter/material.dart';
// ignore: implementation_imports
import 'package:provider/src/provider.dart';

class HomeRoute extends StatelessWidget {
  const HomeRoute({Key? key, required this.name}) : super(key: key);

  final String? name;

    @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Welcome to My Fitness App but you are logged in now!'),
        ),
        body: Container(
        child: Column(children: [
          Text("Welcome to my App, " + name!),
          ElevatedButton(
            onPressed: (){
              context.read<AuthenticationService>().signOut();
            }, 
            child: const Text("Log out"))
        ],),
      )
      ),
    );
  }
}