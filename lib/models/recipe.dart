import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:recipe_app/models/ingredient.dart';
import 'package:recipe_app/models/tag.dart';

class RecipeModel extends ChangeNotifier {
  /// Internal, private state of the cart.

  final List<IngredientModel> _ingredients = [];
  final List<TagModel> _tags = [];

  UnmodifiableListView get ingredients => UnmodifiableListView(_ingredients);
  UnmodifiableListView get tags => UnmodifiableListView(_tags);

  /// An unmodifiable view of the items in the cart.
  // UnmodifiableListView<Item> get items => UnmodifiableListView(_items);

  void addIngredient(IngredientModel ingredient) {
    _ingredients.add(ingredient);
    // This call tells the widgets that are listening to this model to rebuild.
    notifyListeners();
  }

  /// Removes all items from the cart.
  void removeAllIngredients() {
    _ingredients.clear();
    // This call tells the widgets that are listening to this model to rebuild.
    notifyListeners();
  }

  void addTag(TagModel tag) {
    _tags.add(tag);
    notifyListeners();
  }
}
