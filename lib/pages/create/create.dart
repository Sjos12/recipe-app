import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/layouts/layout.dart';
import 'package:recipe_app/models/recipe.dart';
import 'package:recipe_app/pages/create/ingredients.dart';
import 'package:recipe_app/pages/create/instructions.dart';

class CreateRecipeWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CreateRecipeState();
  }
}

class _CreateRecipeState extends State<CreateRecipeWidget> {
  @override
  Widget build(BuildContext context) {
    return LayoutWidget(
        title: 'Creating a recipe',
        child: Center(
          child: ChangeNotifierProvider<RecipeModel>(
            create: (context) => RecipeModel(),
            child: Wrap(spacing: 20, children: [
              TextField(
                onChanged: (text) => print('tap'),
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: 'Name your recipe'),
              ),
              IngredientsWidget(),
              InstructionsWidget(),
              Row(
                children: [
                  ElevatedButton(onPressed: () {}, child: Text('Submit'))
                ],
              )
            ]),
          ),
        ));
  }
}
