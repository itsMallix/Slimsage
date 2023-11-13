// import 'package:dio/dio.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:miniproject/models/meals_models/model_meals.dart';

// class MealProvider extends ChangeNotifier {
//   List<MealsModel> _meals = [];

//   List<MealsModel> get meals => _meals;

//   final String apikey = 'YOUR_SPOONACULAR_API';

//   Future<void> fetchMeals() async {
//     try {
//       final response = await Dio().get(
//           'https://api.spoonacular.com/recipes/complexSearch?apiKey=$apikey&diet=$diet');
//       final data = response.data;
//       final results = data['results'] as List<dynamic>;

//       final meals = results
//           .map((meals) => MealsModel(
//                 id: meals['id'],
//                 title: meals['title'],
//                 image: meals['image'],
//               ))
//           .toList();
//       _meals = meals;
//       notifyListeners();
//     } catch (e) {
//       print(e);
//     }
//   }
// }
