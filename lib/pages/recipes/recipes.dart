import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app/layouts/layout.dart';
import 'package:recipe_app/models/recipe.dart';
import 'package:recipe_app/pages/recipes/recipe.dart';

class RecipesWidget extends StatefulWidget {
  List<RecipeModel> recipes = [];
  RecipesWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return RecipesWidgetState();
  }
}

class RecipesWidgetState extends State<RecipesWidget> {
  @override
  Widget build(BuildContext context) {
    return LayoutWidget(
      child: Column(children: [
        for (var recipe in widget.recipes)
          RecipeWidget(
            recipe: recipe,
          )
      ]),
    );
  }
}
