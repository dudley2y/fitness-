import 'dart:js';
import 'package:fitness/authentication_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'signup.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({ Key? key }) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {

  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController(); 

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Welcome to My Fitness App"),
      ),
      body: Form( 
        key: _formKey,
        child: Column(
          children:  <Widget>[
            const Center(  
              child: Text("Log in")
            ),
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
              obscureText: false,
              decoration: const InputDecoration(
                labelText: "Email"
              ),
              controller: _emailController
            ),
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
              obscureText: false,
              decoration: const InputDecoration(
                labelText: "Password"
              ),
              controller: _passwordController
            ),
            Center( 
              child: ElevatedButton(
                onPressed: () {
                  final value = _formKey.currentState!.validate();

                  if(value){
                    
                    context.read<AuthenticationService>().signIn(
                      email: _emailController.text.trim(), 
                      password: _passwordController.text.trim()
                    );

                  }
                },
                child: const Text("Logged in"),
              ),
            ),
            Center( 
              child: ElevatedButton(
                onPressed: (){
                  Navigator.push(
                    context, 
                    MaterialPageRoute(
                      builder: (context) => const SignupForm()
                      )
                    );
                  },
                  child: const Text("Create an Account"),
                ),
            )

          ],
        )
      ),
    );
  }
}  