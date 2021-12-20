import 'package:fitness/authentication_service.dart';
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
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _rePasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children:  <Widget>[

          // Name 
           TextFormField(
             validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
            obscureText: false,
            decoration: const InputDecoration(
              labelText: "Name"
            ),
            controller: _nameController,
          ),

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
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Processing"))
                    );

                    print(_emailController.text.trim());

                    context.read<AuthenticationService>().signUp(
                      email: _emailController.text.trim(),
                      password: _passwordController.text.trim()
                    );

                    final temp = _nameController.text;
                    Navigator.pushReplacement(context, MaterialPageRoute( builder: (context) => SecondRoute(name: temp)));
                    _nameController.text = '';
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