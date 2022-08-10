import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/enums/ingedient_types.dart';
import 'package:recipe_app/helpers/ingredient_icons.dart';
import 'package:recipe_app/models/ingredient.dart';
import 'package:recipe_app/models/recipe.dart';
import 'package:recipe_app/pages/create/create_ingredient.dart';

class IngredientsWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState

    return IngredientsState();
  }
}

class IngredientsState extends State<IngredientsWidget> {
  Widget listOfIngredients(RecipeModel value) {
    List<Widget> ingredientWidgets = [];

    for (int i = 0; i < value.ingredients.length; i++) {
      IngredientModel ingredient = value.ingredients[i];
      ingredientWidgets.add(Card(
          child: ListTile(
        leading: IngredientIcons.get(ingredient.type),
        title: Text(ingredient.name),
      )));
    }
    return Column(children: ingredientWidgets);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Consumer<RecipeModel>(builder: ((context, RecipeModel value, child) {
      return Column(children: [
        listOfIngredients(value),
        ElevatedButton(
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ChangeNotifierProvider(
                          create: (_) => RecipeModel(),
                          child: CreateIngredientWidget())));

              // Provider.of<RecipeModel>(context, listen: false).addIngredient(
              //     IngredientModel(type: IngredientTypes.dairy, name: 'Milk'));
            },
            child: const Text('Add ingredient')),
      ]);
    }));
  }
}
