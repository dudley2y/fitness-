import 'package:flutter/material.dart';

class SecondRoute extends StatelessWidget {
  const SecondRoute({Key? key, required this.name}) : super(key: key);

  final String name;

  Widget welcomeMessage(){
    return Container(
      child: Column(
        children: <Widget>[
          Text("Welcome to my App, " + name)
        ]
      )
    );

  }

    @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Second Route"),
      ),
      body: welcomeMessage()
    );
  }
}