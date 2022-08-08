import 'package:flutter/material.dart';
import 'package:recipe_app/pages/recipes/recipe-overview.dart';

class RecipeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        isThreeLine: false,
        leading: FlutterLogo(),
        title: Text('Pasta carbonara'),
        subtitle: Text('Dairy, vegetables, meat'),
        onTap: (() => {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => RecipeOverviewWidget()))
            }),
      ),
    );
  }
}
