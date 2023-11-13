import 'package:flutter/foundation.dart';
import 'package:miniproject/models/meals_models/model_meals.dart';

class MealFavoriteProvider with ChangeNotifier {
  List<MealsModel> _favorites = [];

  List<MealsModel> get favorites => _favorites;

  void toggleFavorite(int mealId, String title, String image) {
    final existingIndex = _favorites.indexWhere((meal) => meal.id == mealId);
    if (existingIndex >= 0) {
      _favorites.removeAt(existingIndex);
    } else {
      _favorites.add(MealsModel(id: mealId, title: title, image: image));
    }
    notifyListeners();
  }

  void removeFavorite(int mealId) {
    _favorites.removeWhere((meal) => meal.id == mealId);
    notifyListeners();
  }
}
