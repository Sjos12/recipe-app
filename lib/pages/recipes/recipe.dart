import 'package:flutter/material.dart';
import 'package:recipe_app/models/recipe.dart';
import 'package:recipe_app/pages/recipes/recipe-overview.dart';

class RecipeWidget extends StatefulWidget {
  RecipeModel recipe;

  RecipeWidget({Key? key, required this.recipe}) : super(key: key);

  @override
  State<RecipeWidget> createState() => _RecipeWidgetState();
}

class _RecipeWidgetState extends State<RecipeWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        isThreeLine: false,
        leading: FlutterLogo(),
        title: Text(widget.recipe.name),
        subtitle: Text(widget.recipe.ingredients.toList().toString()),
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
