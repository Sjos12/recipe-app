import 'package:flutter/cupertino.dart';
import 'package:recipe_app/enums/ingedient_types.dart';
import 'package:recipe_app/models/tag.dart';

class IngredientModel extends ChangeNotifier {
  

  final List<TagModel> tags = [];
  final IngredientTypes type;
  final String name;

  set name(String name) {
    name = name;
  }

  void addTag(TagModel tag) {
    tags.add(tag);
    notifyListeners();
  }
}
