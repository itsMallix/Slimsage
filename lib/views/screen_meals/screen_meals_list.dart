import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:miniproject/components/theme.dart';
import 'package:miniproject/models/meals_models/model_detail_meals.dart';
import 'package:miniproject/models/meals_models/model_meals.dart';
import 'package:miniproject/views/screen_meals/screen_meals_details.dart';
import 'package:http/http.dart' as http;

class MealListScreen extends StatefulWidget {
  final List<MealsModel> meals;

  const MealListScreen({Key? key, required this.meals}) : super(key: key);

  @override
  State<MealListScreen> createState() => _MealListScreenState();
}

class _MealListScreenState extends State<MealListScreen> {
  Future<MealDetailModel> fetchMealDetailFromAPI(int mealId) async {
    const apiKey = "YOUR_SPOONACULAR_API";
    final apiUrl =
        "https://api.spoonacular.com/recipes/$mealId/information?apiKey=$apiKey";

    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final MealDetailModel mealDetail = MealDetailModel.fromJson(data);
      return mealDetail;
    } else {
      throw Exception('Failed to load meal detail');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Meal List",
          style: DesignSystem.headlineMedium,
        ),
      ),
      body: ListView.builder(
        itemCount: widget.meals.length,
        itemBuilder: (context, index) {
          final meal = widget.meals[index];
          return GestureDetector(
            onTap: () async {
              final mealDtail = await fetchMealDetailFromAPI(meal.id);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MealDetailScreen(
                    mealDetail: mealDtail,
                  ),
                ),
              );
            },
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8.0),
              child: Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: DesignSystem.white,
                  border: Border.all(color: DesignSystem.maingrey),
                ),
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(10),
                        bottom: Radius.circular(10),
                      ),
                      child: SizedBox(
                        width: double.infinity,
                        child: Image.network(
                          meal.image,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: DesignSystem.black.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    Center(
                      child: SizedBox(
                        width: 300,
                        child: Text(
                          meal.title,
                          style: DesignSystem.headlineSmallWhite,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
