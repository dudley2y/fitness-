import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Fitness App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Welcome to My Fitness App'),
        ),
        body: const Center(
          child: LoginForm()
        ),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({ Key? key }) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {

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
                      const SnackBar(content: Text("True"))
                    );
                  }

              },
              child: const Text("Yip Yip"))
        )
        ],
      ),
    );
  }
}