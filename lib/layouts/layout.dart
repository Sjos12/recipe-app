import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app/pages/create/create.dart';

class LayoutWidget extends StatelessWidget {
  Widget child;
  String? title;
  LayoutWidget({Key? key, required this.child, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipe App',
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
            title: Text(title ?? 'Recipe feed'),
            backgroundColor: Colors.green,
            automaticallyImplyLeading: true,
            leading: TextButton(
              child: Icon(Icons.logout),
              onPressed: (() => FirebaseAuth.instance.signOut()),
            )),
        body: child,
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CreateRecipeWidget()),
              );
            }),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.receipt),
              label: 'Recipes',
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.abc), label: 'Ingredients'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ],
        ),
      ),
    );
  }
}
