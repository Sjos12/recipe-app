import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app/enums/authenticate_widget_states.dart';
import 'package:recipe_app/layouts/layout.dart';

import '../recipes/recipes.dart';

class AuthenticateWidget extends StatefulWidget {
  const AuthenticateWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return AuthenticateWidgetState();
  }
}

class AuthenticateWidgetState extends State<AuthenticateWidget> {
  AuthenticateWidgetStates _stateOfWidget = AuthenticateWidgetStates.login;

  String _email = '';
  String _password = '';

  AuthenticateWidgetStates get oppositeState =>
      _stateOfWidget == AuthenticateWidgetStates.login
          ? AuthenticateWidgetStates.register
          : AuthenticateWidgetStates.login;

  void signIn() async {
    if (_stateOfWidget != AuthenticateWidgetStates.login) return;

    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: _email, password: _password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  void signUp() async {
    if (_stateOfWidget != AuthenticateWidgetStates.register) return;

    try {
      // UserCredential userCredential =
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _email,
        password: _password,
      );
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.green,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Text(_stateOfWidget.name),
            backgroundColor: Colors.green,
            automaticallyImplyLeading: true,
          ),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Wrap(
                runSpacing: 20,
                children: [
                  TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), hintText: 'Email'),
                    onChanged: ((value) => _email = value),
                  ),
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Password',
                    ),
                    onChanged: ((value) => _password = value),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                          onPressed: () => {
                                if (_stateOfWidget ==
                                    AuthenticateWidgetStates.login)
                                  {signIn()}
                                else
                                  {signUp()}
                              },
                          child: Text('Submit')),
                      TextButton(
                          onPressed: () => setState(() {
                                _stateOfWidget = oppositeState;
                              }),
                          child: Text(oppositeState.name))
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
