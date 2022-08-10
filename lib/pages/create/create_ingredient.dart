import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/enums/ingedient_types.dart';
import 'package:recipe_app/layouts/layout.dart';
import 'package:recipe_app/models/ingredient.dart';
import 'package:recipe_app/models/recipe.dart';

class CreateIngredientWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CreateIngredientWidgetState();
}

class CreateIngredientWidgetState extends State<CreateIngredientWidget> {
  IngredientModel ingredient =
      IngredientModel(type: IngredientTypes.dairy, name: '');

  List<DropdownMenuItem<IngredientTypes>> ingredientTypes = [];

  @override
  void initState() {
    List<IngredientTypes> values = IngredientTypes.values;

    for (var value in values) {
      ingredientTypes
          .add(DropdownMenuItem(value: value, child: Text(value.toString())));
    }

    super.initState();
  }

  void submit() {
    print('${ingredient.name} ${ingredient.type}');
    Navigator.pop(context);
    Provider.of<RecipeModel>(context, listen: false).addIngredient(ingredient);
  }

  @override
  Widget build(BuildContext context) {
    return LayoutWidget(
        title: 'Creating ingredient',
        child: Column(children: [
          TextField(
            onChanged: (String value) {
              setState(() {
                ingredient =
                    IngredientModel(type: ingredient.type, name: value);
              });
            },
            decoration: const InputDecoration(
                border: OutlineInputBorder(), hintText: 'Name ingredient'),
          ),
          DropdownButton<IngredientTypes>(
              items: ingredientTypes,
              onChanged: (IngredientTypes? newValue) {
                setState(() {
                  ingredient =
                      IngredientModel(type: newValue!, name: ingredient.name);
                });
              }),
          ElevatedButton(
              onPressed: submit, child: const Text('Create ingredient'))
        ]));
  }
}
