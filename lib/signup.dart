import 'dart:js';
import 'package:fitness/authentication_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({ Key? key }) : super(key: key);

  @override
  _SignupFormState createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {

  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _rePasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: const Text('Welcome to My Fitness App'),
        ),
        body: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              const Center(
                child: Text("Sign up "),
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
              labelText: "First Name"
            ),
            controller: _firstNameController), 

            // Last name 

            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
              obscureText: false,
              decoration: const InputDecoration(
              labelText: "Last Name"
            ),
            controller: _lastNameController),

            // Email 
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
              controller: _emailController,
            ),

            // Password
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                else if( _passwordController.text != _rePasswordController.text){
                  return 'Not equal with Retry';
                }
                return null;
              },
              obscureText: true,
              decoration: const InputDecoration(
                labelText: "Password"
              ),
              controller: _passwordController,
            ),

            // Re-enter password
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                else if( _passwordController.text != _rePasswordController.text){
                  return 'Not equal with Password';
                }
                return null;
              },
              obscureText: true,
              decoration: const InputDecoration(
                labelText: "Re-enter Password"
              ),
              controller: _rePasswordController,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 50.0),
              child: ElevatedButton(
                onPressed: () async {
                  
                    final value = _formKey.currentState!.validate();

                    if(value){
                      String? result = await context.read<AuthenticationService>().signUp(
                        email: _emailController.text.trim(),
                        password: _passwordController.text.trim()
                      );

                      if(result != "Signed up"){
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(result!)
                        )
                      );
                    }

                      context.read<AuthenticationService>().initUser(
                        _firstNameController.text.trim(), 
                        _lastNameController.text.trim()
                      );

                      _firstNameController.text = '';
                      _lastNameController.text = '';
                      _emailController.text = '';
                      _passwordController.text = '';
                      _rePasswordController.text = '';
                      Navigator.pop(context);
                    }
                },
                child: const Text("Yip Yip"))
              )
            ],
          )
        ),
      );
  }
}
