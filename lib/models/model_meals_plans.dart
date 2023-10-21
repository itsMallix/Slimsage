import 'package:miniproject/models/model_meals.dart';

class MealPlan {
  final List<Meal> meals;
  final double calories, carbs, fat, protein;

  MealPlan({
    required this.meals,
    required this.calories,
    required this.carbs,
    required this.fat,
    required this.protein,
  });

  factory MealPlan.fromMap(Map<String, dynamic> map) {
    List<Meal> meals = [];
    map['meals'].forEach((mealMap) => meals.add(Meal.fromMap(mealMap)));
    return MealPlan(
      meals: meals,
      calories: map['nutrients']['calories'],
      carbs: map['nutrients']['carbohdrates'],
      fat: map['nutrients']['fat'],
      protein: map['nutrients']['protein'],
    );
  }
}
