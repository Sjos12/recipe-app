import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/models/recipe.dart';

class IngredientsWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState

    return IngredientsState();
  }
}

class IngredientsState extends State<IngredientsWidget> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Consumer<RecipeModel>(builder: ((context, RecipeModel value, child) {
      value.ingredients.forEach(() => {
        
      })
    }));
  }
}
