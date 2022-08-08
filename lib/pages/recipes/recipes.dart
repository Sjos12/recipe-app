import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app/layouts/layout.dart';
import 'package:recipe_app/pages/recipes/recipe.dart';

class RecipesWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutWidget(
      child: Column(children: [RecipeWidget()]),
    );
  }
}
