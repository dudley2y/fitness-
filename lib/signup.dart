import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fitness/authentication_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'SecondRoute.dart';

class signupForm extends StatefulWidget {
  const signupForm({ Key? key }) : super(key: key);

  @override
  _signupFormState createState() => _signupFormState();
}

class _signupFormState extends State<signupForm> {

  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _rePasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children:  <Widget>[

          // First name 

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
              onPressed: (){
                
                  final value = _formKey.currentState!.validate();

                  if(value){
                    
                    context.read<AuthenticationService>().signUp(
                      email: _emailController.text.trim(),
                      password: _passwordController.text.trim()
                    );


                    String? uid = context.read<AuthenticationService>().id();

                    final usersRef = FirebaseFirestore.instance.collection('users');

                    usersRef.doc(uid).set(
                      {
                        "first_name": _firstNameController.text, 
                        "last_name": _lastNameController.text
                        }
                    );

                    final temp = _firstNameController.text;
                    //Navigator.pushReplacement(context, MaterialPageRoute( builder: (context) => SecondRoute(name: temp)));
                    _firstNameController.text = '';
                    _lastNameController.text = '';
                    _emailController.text = '';
                    _passwordController.text = '';
                    _rePasswordController.text = '';
                  
                  }
              },
              child: const Text("Yip Yip"))
        )
        ],
      ),
    );
  }
}