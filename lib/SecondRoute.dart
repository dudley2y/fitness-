import 'package:fitness/authentication_service.dart';
import 'package:flutter/material.dart';
// ignore: implementation_imports
import 'package:provider/src/provider.dart';

class SecondRoute extends StatelessWidget {
  const SecondRoute({Key? key, required this.name}) : super(key: key);

  final String? name;

    @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Second Route"),
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
    );
  }
}