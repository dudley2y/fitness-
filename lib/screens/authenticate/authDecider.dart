import 'package:fitness/screens/authenticate/login.dart';
import 'package:fitness/screens/authenticate/signup.dart';
import 'package:flutter/material.dart';

class AuthDecider extends StatefulWidget {
  const AuthDecider({ Key? key }) : super(key: key);

  @override
  _AuthDeciderState createState() => _AuthDeciderState();
}

class _AuthDeciderState extends State<AuthDecider> {

  bool showSignUp = false;

  void toggleView(){
    setState(() {
      showSignUp = !showSignUp;
    });
  }

  @override
  Widget build(BuildContext context) {
    if(showSignUp){
      return SignupForm(toggleView: toggleView,);
    }
    else{ 
      return LoginForm(toggleView: toggleView);
    }
  }
}