import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app/enums/ingedient_types.dart';

class IngredientIcons {
  static Widget get(IngredientTypes type) {
    switch (type) {
      case (IngredientTypes.dairy):
        {
          return const Icon(Icons.add);
        }
        break;
      case (IngredientTypes.fruit):
        {
          return const Icon(Icons.apple);
        }
        break;
      case (IngredientTypes.gluten):
        {
          return const Icon(Icons.wechat);
        }
      default:
        return FlutterLogo();
    }
  }
}
