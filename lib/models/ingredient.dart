import 'package:flutter/cupertino.dart';
import 'package:recipe_app/enums/ingedient_types.dart';
import 'package:recipe_app/models/tag.dart';

class IngredientModel extends ChangeNotifier {
  IngredientModel({required this.type, required this.name});

  final List<TagModel> tags = [];
  final IngredientTypes type;
  final String name;

  void addTag(TagModel tag) {
    tags.add(tag);
    notifyListeners();
  }
}
