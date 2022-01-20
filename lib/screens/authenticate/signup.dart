import 'package:fitness/services/authentication_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({Key? key, required this.toggleView}) : super(key: key);

  final Function toggleView;

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
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.blue[800],
            ),
            flex: 1,
          ),
          Expanded(
            child: Stack(
              children: [
                Container(color: Colors.white),
                Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.1,
                      right: MediaQuery.of(context).size.width * 0.1),
                  child: Container(
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey,
                                spreadRadius: 1,
                                blurRadius: 3,
                                offset: Offset(0, 3))
                          ],
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      transform: Matrix4.translationValues(0, -150, 0),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: 10),
                                child: Text(
                                  "Sign Up",
                                  style: TextStyle(
                                      fontSize: 25, color: Colors.grey[700]),
                                ),
                              ),
                              Padding(   
                                padding: EdgeInsets.only(left:20),
                                child: Column(    
                                  children: [
                      
                                    Align(child: Text("First Name", style: TextStyle( fontSize: 20, color: Colors.blue[800]),),
                                      alignment: Alignment.centerLeft,
                                    ),
                                    TextFormField(
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter a Email';
                                        }
                                        return null;
                                      },
                                      controller: _firstNameController,
                                      decoration: const InputDecoration(
                                        border: UnderlineInputBorder(),
                                        hintText: 'Enter your First Name',
                                      ),
                                    ),
                                    Align(
                                      child:Text("Last Name", style: TextStyle( fontSize: 20, color: Colors.blue[800])),
                                      alignment: Alignment.centerLeft,

                                    ),
                                    Align(
                                      child: Text("Email", style: TextStyle( fontSize: 20, color: Colors.blue[800])),
                                      alignment: Alignment.centerLeft,

                                    ),
                                    Align(
                                      child: Text("Password", style: TextStyle( fontSize: 20, color: Colors.blue[800])),
                                      alignment: Alignment.centerLeft,

                                    ),
                                    Align(
                                      child: Text("Confirm Password", style: TextStyle( fontSize: 20, color: Colors.blue[800])),
                                      alignment: Alignment.centerLeft,
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      )),
                )
              ],
            ),
          )
        ],
      ),
    );

    //   return Scaffold(
    //       appBar: AppBar(
    //         title: const Text('Welcome to My Fitness App'),
    //       ),
    //       body: Form(
    //         key: _formKey,
    //         child: Column(
    //           children: <Widget>[
    //             const Center(
    //               child: Text("Sign up "),
    //             ),
    //             TextFormField(
    //             validator: (value) {
    //               if (value == null || value.isEmpty) {
    //                 return 'Please enter some text';
    //               }
    //               return null;
    //             },
    //             obscureText: false,
    //             decoration: const InputDecoration(
    //             labelText: "First Name"
    //           ),
    //           controller: _firstNameController),

    //           // Last name

    //           TextFormField(
    //             validator: (value) {
    //               if (value == null || value.isEmpty) {
    //                 return 'Please enter some text';
    //               }
    //               return null;
    //             },
    //             obscureText: false,
    //             decoration: const InputDecoration(
    //             labelText: "Last Name"
    //           ),
    //           controller: _lastNameController),

    //           // Email
    //           TextFormField(
    //             validator: (value) {
    //               if (value == null || value.isEmpty) {
    //                 return 'Please enter some text';
    //               }
    //               return null;
    //             },
    //             obscureText: false,
    //             decoration: const InputDecoration(
    //               labelText: "Email"
    //             ),
    //             controller: _emailController,
    //           ),

    //           // Password
    //           TextFormField(
    //             validator: (value) {
    //               if (value == null || value.isEmpty) {
    //                 return 'Please enter some text';
    //               }
    //               else if( _passwordController.text != _rePasswordController.text){
    //                 return 'Not equal with Retry';
    //               }
    //               return null;
    //             },
    //             obscureText: true,
    //             decoration: const InputDecoration(
    //               labelText: "Password"
    //             ),
    //             controller: _passwordController,
    //           ),

    //           // Re-enter password
    //           TextFormField(
    //             validator: (value) {
    //               if (value == null || value.isEmpty) {
    //                 return 'Please enter some text';
    //               }
    //               else if( _passwordController.text != _rePasswordController.text){
    //                 return 'Not equal with Password';
    //               }
    //               return null;
    //             },
    //             obscureText: true,
    //             decoration: const InputDecoration(
    //               labelText: "Re-enter Password"
    //             ),
    //             controller: _rePasswordController,
    //           ),
    //           Row(
    //             mainAxisAlignment: MainAxisAlignment.center,
    //             children: [
    //               ElevatedButton(
    //                 child: const Text("Go back"),
    //                 onPressed: (){
    //                   widget.toggleView();
    //                 },
    //               ),
    //               ElevatedButton(
    //                 onPressed: () async {

    //                   final value = _formKey.currentState!.validate();

    //                   if(value){
    //                     String? result = await context.read<AuthenticationService>().signUp(
    //                       email: _emailController.text.trim(),
    //                       password: _passwordController.text.trim(),
    //                       first: _firstNameController.text.trim(),
    //                       last: _lastNameController.text.trim()
    //                     );

    //                     if(result != "Signed up"){
    //                       ScaffoldMessenger.of(context).showSnackBar(
    //                         SnackBar(
    //                           content: Text(result!)
    //                         )
    //                       );
    //                     }
    //                     else{
    //                       _firstNameController.text = '';
    //                       _lastNameController.text = '';
    //                       _emailController.text = '';
    //                       _passwordController.text = '';
    //                       _rePasswordController.text = '';

    //                       widget.toggleView();
    //                     }
    //                   }
    //                 },
    //                 child: const Text("Yip Yip")
    //               )
    //             ]
    //           )
    //           ]
    //         )
    //       )
    //     );
    // }
  }
}
