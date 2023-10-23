import 'package:flutter/material.dart';
import 'package:miniproject/models/model_meals_plans.dart';
import 'package:miniproject/utils/api_service.dart';

class MealPlanScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meal Plan'),
      ),
      body: FutureBuilder<MealPlan>(
        future: ApiService.instance
            .generateMealPlan(targetCalories: 2000, diet: 'None'),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else if (!snapshot.hasData) {
            return Text('No data available.');
          } else {
            MealPlan mealPlan = snapshot.data!;
            // Display the meal plan data here
            return Text('Meal Plan: ${mealPlan.toString()}');
          }
        },
      ),
    );
  }
}
