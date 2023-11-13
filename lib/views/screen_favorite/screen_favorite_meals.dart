import 'package:flutter/material.dart';
import 'package:miniproject/components/theme.dart';
import 'package:miniproject/models/meals_models/meals_favorite_provider.dart';
import 'package:miniproject/views/screen_favorite/empty_favorite_meals.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';

class FavoriteMealScreen extends StatelessWidget {
  const FavoriteMealScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MealFavoriteProvider>(context);
    final favoriteMeals = provider.favorites;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Favorites Meals",
          style: DesignSystem.headlineMedium,
        ),
      ),
      body: favoriteMeals.isEmpty
          ? const EmptyMealScreen()
          : buildFavoriteMealScreen(context),
    );
  }

  Widget buildFavoriteMealScreen(BuildContext context) {
    final provider = Provider.of<MealFavoriteProvider>(context);
    final favoriteMeals = provider.favorites;

    return ListView.builder(
      itemCount: favoriteMeals.length,
      itemBuilder: (context, index) {
        final meal = favoriteMeals[index];
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            height: 100,
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(color: DesignSystem.maingrey),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                SizedBox(
                  height: 80,
                  width: 110,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      meal.image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                // const SizedBox(width: 5),
                const Spacer(),
                SizedBox(
                  width: 170,
                  child: Text(
                    meal.title,
                    style: DesignSystem.headlineSmall,
                  ),
                ),
                const SizedBox(width: 5),
                GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text(
                          "Delete ${meal.title}",
                          style: DesignSystem.headlineSmall,
                        ),
                        content: Text(
                          "Are you sure you want to delete this meal?",
                          style: DesignSystem.bodyLarge,
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text(
                              "Cancel",
                              style: DesignSystem.bodyMedium,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              provider.removeFavorite(meal.id);
                              Navigator.pop(context);
                            },
                            child: const Text(
                              "Delete",
                              style: DesignSystem.bodyMedium,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  child: Container(
                    height: 80,
                    width: 50,
                    decoration: BoxDecoration(
                      color: DesignSystem.mainRed,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(Icons.delete, color: DesignSystem.white),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
