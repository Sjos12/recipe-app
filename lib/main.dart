import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app/pages/auth/login.dart';
import 'package:recipe_app/pages/recipes/recipes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Ideal time to initialize
  await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
  FirebaseFirestore.instance.useFirestoreEmulator('localhost', 8080);

  FirebaseAuth.instance.authStateChanges().listen((User? user) {
    if (user == null) {
      print('signed out');
      runApp(AuthenticateWidget());
    }
    if (user != null) {
      print('${user.displayName} is currently signed in');
      runApp(MyApp());
    }
  });
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  FirebaseAuth auth = FirebaseAuth.instance;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return RecipesWidget();
  }
}
