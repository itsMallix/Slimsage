import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:miniproject/components/theme.dart';
import 'package:miniproject/models/meals_models/model_diet_category.dart';
import 'package:miniproject/models/meals_models/model_meals.dart';
import 'package:miniproject/views/screen_favorite/screen_favorite_meals.dart';
import 'package:miniproject/views/screen_meals/screen_meals_list.dart';

class MealScreen extends StatefulWidget {
  const MealScreen({Key? key}) : super(key: key);

  @override
  State<MealScreen> createState() => _MealScreenState();
}

class _MealScreenState extends State<MealScreen> {
  List<DietCategoryModel> dietCategoryList = [
    DietCategoryModel(
      image: "assets/images/mealScreen/object_1.svg",
      title: "Glutten Free",
    ),
    DietCategoryModel(
      image: "assets/images/mealScreen/object_2.svg",
      title: "Kategonic",
    ),
    DietCategoryModel(
      image: "assets/images/mealScreen/object_3.svg",
      title: "Lacto-Vegetarian",
    ),
    DietCategoryModel(
      image: "assets/images/mealScreen/object_4.svg",
      title: "Ovo-Vegetarian",
    ),
    DietCategoryModel(
      image: "assets/images/mealScreen/object_5.svg",
      title: "Vegan",
    ),
    DietCategoryModel(
      image: "assets/images/mealScreen/object_6.svg",
      title: "Pescetarian",
    ),
    DietCategoryModel(
      image: "assets/images/mealScreen/object_7.svg",
      title: "Paleo",
    ),
    DietCategoryModel(
      image: "assets/images/mealScreen/object_8.svg",
      title: "Primal",
    ),
    DietCategoryModel(
      image: "assets/images/mealScreen/object_9.svg",
      title: "Whole30",
    ),
  ];

  List<MealsModel> meals = [];

  Future<void> fetchMealsByDiet(String diet) async {
    try {
      final response = await Dio().get(
        'https://api.spoonacular.com/recipes/complexSearch?apiKey=95a614b6dc2a457eb00cac031302195b&diet=$diet',
      );
      final data = response.data;
      final results = data['results'] as List<dynamic>;
      final fetchMelas = results.map(
        (meal) {
          return MealsModel(
            id: meal['id'],
            title: meal['title'],
            image: meal['image'],
          );
        },
      ).toList();
      setState(() {
        meals = fetchMelas;
      });
    } catch (err) {
      print('Error fetching recipes: $err');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              SizedBox(
                height: 100,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    Container(
                      width: 250,
                      height: 70,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(100),
                          topLeft: Radius.circular(12),
                          bottomLeft: Radius.circular(12),
                          bottomRight: Radius.circular(12),
                        ),
                        color: DesignSystem.mainYellow,
                      ),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.all(10),
                                child: SizedBox(
                                  width: 150,
                                  child: Text(
                                    "Embark on Your Healthy Journey",
                                    style: DesignSystem.headlineSmallWhite,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: SizedBox(
                                  width: 70,
                                  height: 70,
                                  child: SvgPicture.asset(
                                    "assets/images/mealScreen/slide_1.svg",
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      width: 250,
                      height: 70,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(100),
                          topLeft: Radius.circular(12),
                          bottomLeft: Radius.circular(12),
                          bottomRight: Radius.circular(12),
                        ),
                        color: DesignSystem.mainBlue,
                      ),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.all(10),
                                child: SizedBox(
                                  width: 150,
                                  child: Text(
                                    "Eat Smart, Live Better And More Better",
                                    style: DesignSystem.headlineSmallWhite,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: SizedBox(
                                  width: 70,
                                  height: 70,
                                  child: SvgPicture.asset(
                                    "assets/images/mealScreen/slide_2.svg",
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      width: 250,
                      height: 70,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(100),
                          topLeft: Radius.circular(12),
                          bottomLeft: Radius.circular(12),
                          bottomRight: Radius.circular(12),
                        ),
                        color: DesignSystem.mainGreen,
                      ),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.all(10),
                                child: SizedBox(
                                  width: 150,
                                  child: Text(
                                    "Achieve Your Wellness Goals with Us",
                                    style: DesignSystem.headlineSmallWhite,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: SizedBox(
                                  width: 70,
                                  height: 70,
                                  child: SvgPicture.asset(
                                    "assets/images/mealScreen/slide_3.svg",
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Container(
                height: 90,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: DesignSystem.mainRed,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Adding Meals To Your Favorites",
                            style: DesignSystem.headlineSmallWhite,
                          ),
                          const SizedBox(height: 15),
                          SizedBox(
                            height: 30,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: DesignSystem.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(7.0),
                                ),
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const FavoriteMealScreen(),
                                  ),
                                );
                              },
                              child: const Text(
                                "My Favorite",
                                style: DesignSystem.bodyMedium,
                              ),
                            ),
                          )
                        ],
                      ),
                      const Spacer(),
                      SizedBox(
                        height: 70,
                        width: 70,
                        child: SvgPicture.asset(
                          "assets/images/mealScreen/banner.svg",
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Row(
                children: [
                  Text(
                    "Good For Diet",
                    style: DesignSystem.headlineSmall,
                  ),
                  Spacer(),
                ],
              ),
              GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                ),
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: dietCategoryList.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      final selectedDiet = dietCategoryList[index].title;

                      fetchMealsByDiet(selectedDiet);
                      setState(() {});

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MealListScreen(meals: meals),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Container(
                        height: 100,
                        decoration: BoxDecoration(
                            color: DesignSystem.grey,
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 40,
                                width: 60,
                                child: SvgPicture.asset(
                                    dietCategoryList[index].image),
                              ),
                              const SizedBox(height: 7),
                              Text(
                                dietCategoryList[index].title,
                                style: DesignSystem.bodySmall,
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
