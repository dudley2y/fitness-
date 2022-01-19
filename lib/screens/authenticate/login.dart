import 'package:fitness/services/authentication_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key, required this.toggleView}) : super(key: key);

  final Function toggleView;

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
        body: Column(
      children: [
        Expanded(
          child: Container(
            width: MediaQuery.of(context).size.width,
            color: Colors.blue[800],
            child: const Center(
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 100,
              ),
            ),
          ),
          flex: 1,
        ),
        Expanded(
            child: Stack(
              children: [
                Container(
                  color: Colors.white,
                ),
                Column(
                  children: [
                    Container(
                      height: 275,
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
                      transform: Matrix4.translationValues(0, -70, 0),
                      margin: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.1,
                          right: MediaQuery.of(context).size.width * 0.1),
                      child: Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 10),
                          child: Column(
                            children: [
                              Text(
                                "Login",
                                style: TextStyle(
                                    fontSize: 25, color: Colors.grey[700]),
                              ),
                              Form(
                                key: _formKey,
                                child: Column(
                                  children: [
                                    Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          "Email",
                                          style: TextStyle(
                                            color: Colors.blue[800],
                                            fontSize: 20,
                                          ),
                                        )),
                                    TextFormField(
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter a Email';
                                        }
                                        return null;
                                      },
                                      controller: _emailController,
                                      decoration: const InputDecoration(
                                        border: UnderlineInputBorder(),
                                        hintText: 'Enter an Email',
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text("Password",
                                              style: TextStyle(
                                                  color: Colors.blue[800],
                                                  fontSize: 20))),
                                    ),
                                    TextFormField(
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter a Password';
                                        }
                                        return null;
                                      },
                                      controller: _passwordController,
                                      decoration: const InputDecoration(
                                        border: UnderlineInputBorder(),
                                        hintText: 'Enter a Password',
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )),
                    )
                  ],
                ),
                Container(
                  transform: Matrix4.translationValues(0, -70, 0),
                  child: Padding(
                      padding: const EdgeInsets.only(top: 250),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.topCenter,
                            child: SizedBox(
                              width: 250,
                              height: 40,
                              child: ElevatedButton(
                                  onPressed: () async {
                                    final value = _formKey.currentState!.validate();

                                    if (value) {
                                      String? result = await context
                                          .read<AuthenticationService>()
                                          .signIn(
                                              email: _emailController.text.trim(),
                                              password:
                                                  _passwordController.text.trim());

                                      if (result != "Signed in") {
                                        ScaffoldMessenger.of(context).showSnackBar(
                                            SnackBar(content: Text(result!)));
                                      }
                                    }
                                  },
                                  child: const Text("Log In!"),
                                  style: ElevatedButton.styleFrom(
                                      primary: Colors.blue[800])),
                            ),
                          ),
                          Padding(   
                            padding: EdgeInsets.only(top:20),
                            child: ElevatedButton(   
                              onPressed: (){ widget.toggleView();},
                              child: const Text("Sign up"),
                            ),
                          ),
                          Padding(   
                            padding: EdgeInsets.only(top:10),
                            child: ElevatedButton(   
                              onPressed: (){},
                              child: const Text("Forgot Password - Doesn't work don't Press :P "),
                            ),
                          )
                        ],
                      )),
                ),
              ],
            ),
            flex: 1
          ),
      ],
    ));
  }
}
