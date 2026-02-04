import 'package:flutter/material.dart';
import 'package:miniproject/components/theme.dart';
import 'package:miniproject/models/meals_models/meals_favorite_provider.dart';
import 'package:miniproject/models/meals_models/model_detail_meals.dart';
import 'package:provider/provider.dart';

class MealDetailScreen extends StatefulWidget {
  final MealDetailModel mealDetail;

  const MealDetailScreen({super.key, required this.mealDetail});

  @override
  State<MealDetailScreen> createState() => _MealDetailScreenState();
}

class _MealDetailScreenState extends State<MealDetailScreen> {
  String removeHtmlTags(String htmlString) {
    RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);
    return htmlString.replaceAll(exp, '');
  }

  // FIX: Fungsi untuk format score menjadi 2 digit
  String formatScore(double score) {
    return score.toStringAsFixed(2);
  }

  @override
  Widget build(BuildContext context) {
    final mealProvider = Provider.of<MealFavoriteProvider>(context);
    final isFavorite = mealProvider.favorites.any(
      (meal) => meal.id == widget.mealDetail.id,
    );
    final cleanedSummary = removeHtmlTags(widget.mealDetail.summary);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: DesignSystem.white,
        title: const Text("Meal Details", style: DesignSystem.headlineMedium),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  widget.mealDetail.image,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                  loadingProgress.expectedTotalBytes!
                            : null,
                      ),
                    );
                  },
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: 200,
                      color: Colors.grey[300],
                      child: const Center(
                        child: Icon(
                          Icons.broken_image,
                          size: 50,
                          color: Colors.grey,
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 16.0),
              SizedBox(
                width: double.infinity,
                child: Row(
                  children: [
                    Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        color: DesignSystem.mainGreen,
                        borderRadius: BorderRadius.circular(3),
                      ),
                      child: const Icon(
                        Icons.restaurant_rounded,
                        color: DesignSystem.white,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        widget.mealDetail.title,
                        style: DesignSystem.headlineMedium,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Row(
                      children: [
                        Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            color: DesignSystem.mainBlue,
                            borderRadius: BorderRadius.circular(3),
                          ),
                          child: const Icon(
                            Icons.room_service_rounded,
                            color: DesignSystem.white,
                          ),
                        ),
                        const SizedBox(width: 5),
                        Text(
                          "${widget.mealDetail.servings} servings",
                          style: DesignSystem.bodyMedium,
                        ),
                        const SizedBox(width: 10),
                        Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            color: DesignSystem.mainBlue,
                            borderRadius: BorderRadius.circular(3),
                          ),
                          child: const Icon(
                            Icons.timer_rounded,
                            color: DesignSystem.white,
                          ),
                        ),
                        const SizedBox(width: 5),
                        Text(
                          "${widget.mealDetail.readyInMinutes} Minutes",
                          style: DesignSystem.bodyMedium,
                        ),
                        const SizedBox(width: 10),
                        Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            color: DesignSystem.mainBlue,
                            borderRadius: BorderRadius.circular(3),
                          ),
                          child: const Icon(
                            Icons.star_rounded,
                            color: DesignSystem.white,
                          ),
                        ),
                        const SizedBox(width: 5),
                        // FIX: Format score untuk menghindari overflow
                        Text(
                          formatScore(widget.mealDetail.spoonacularScore),
                          style: DesignSystem.bodyMedium,
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {
                            mealProvider.toggleFavorite(
                              widget.mealDetail.id,
                              widget.mealDetail.title,
                              widget.mealDetail.image,
                            );

                            // Perbaiki: Jangan panggil setState di dalam onTap
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  isFavorite
                                      ? "Removed from Favorites!"
                                      : "Added to Favorites!",
                                ),
                                duration: const Duration(seconds: 1),
                              ),
                            );
                          },
                          child: Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              color: isFavorite
                                  ? DesignSystem.mainRed
                                  : DesignSystem.maingrey,
                              borderRadius: BorderRadius.circular(3),
                            ),
                            child: const Icon(
                              Icons.favorite_rounded,
                              color: DesignSystem.white,
                              size: 18,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Divider(),
              const SizedBox(height: 5),
              const Text("Ingredients:", style: DesignSystem.headlineMedium),
              const SizedBox(height: 10),
              GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio:
                      MediaQuery.of(context).size.width /
                      (MediaQuery.of(context).size.width / 2.3),
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                  crossAxisCount: 2,
                ),
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: widget.mealDetail.extendedIngredients.length,
                itemBuilder: (context, index) {
                  final ingredient =
                      widget.mealDetail.extendedIngredients[index];
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: DesignSystem.secondYellow,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            ingredient.name,
                            style: DesignSystem.headlineSmall,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            "${ingredient.amount.toStringAsFixed(1)} ${ingredient.unit}",
                            style: DesignSystem.bodyMedium,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 10),
              const Text("Summary :", style: DesignSystem.headlineMedium),
              const SizedBox(height: 10),
              Text(
                cleanedSummary,
                style: DesignSystem.bodyMedium,
                textAlign: TextAlign.justify,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
