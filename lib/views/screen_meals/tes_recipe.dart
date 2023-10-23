import 'package:flutter/material.dart';
import 'package:miniproject/models/model_recipe.dart';
import 'package:miniproject/utils/api_service.dart';

class RecipeScreen extends StatelessWidget {
  final String recipeId;

  RecipeScreen({required this.recipeId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recipe Details'),
      ),
      body: FutureBuilder<Recipe>(
        future: ApiService.instance.fetchRepcipe(recipeId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else if (!snapshot.hasData) {
            return Text('No data available.');
          } else {
            Recipe recipe = snapshot.data!;
            // Display the recipe details here
            return Text('Recipe: ${recipe.toString()}');
          }
        },
      ),
    );
  }
}
