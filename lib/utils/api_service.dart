import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:miniproject/models/model_recipe.dart';
import 'package:miniproject/models/model_meals_plans.dart';

class ApiService {
  ApiService._instantiate();
  static final ApiService instance = ApiService._instantiate();

  final String _baseUrl = "api.spoonacular.com";
  static const String apiKey = "95a614b6dc2a457eb00cac031302195b";

  Future<MealPlan> generateMealPlan(
      {required int targetCalories, required String diet}) async {
    if (diet == 'None') diet == '';
    Map<String, String> param = {
      'timeFrame': 'day',
      'targetCalories': targetCalories.toString(),
      'diet': diet,
      'apiKey': apiKey
    };

    Uri uri = Uri.https(
      _baseUrl,
      '/recipes/mealplans/generate',
      param,
    );

    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
    };

    try {
      var response = await http.get(uri, headers: headers);
      Map<String, dynamic> data = json.decode(response.body);
      MealPlan mealPlan = MealPlan.fromMap(data);
      return mealPlan;
    } catch (err) {
      throw err.toString();
    }
  }

  Future<Recipe> fetchRepcipe(String id) async {
    Map<String, String> param = {
      'includeNutrition': 'false',
      'apiKey': apiKey,
    };

    Uri uri = Uri.https(
      _baseUrl,
      '/recipes/$id/information',
      param,
    );

    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
    };

    try {
      var response = await http.get(uri, headers: headers);
      Map<String, dynamic> data = json.decode(response.body);
      Recipe recipe = Recipe.fromMap(data);
      return recipe;
    } catch (err) {
      throw err.toString();
    }
  }
}
