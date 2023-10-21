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
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final mealPlan = snapshot.data;
            // Tampilkan hasil rencana makanan di sini sesuai dengan tampilan yang Anda inginkan.
            return Center(
              child: Text('Meal Plan: ${mealPlan?.calories ?? 'No Data'}'),
            );
          }
        },
      ),
    );
  }
}
