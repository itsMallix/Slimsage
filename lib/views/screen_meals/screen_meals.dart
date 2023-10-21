import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:miniproject/components/theme.dart';
import 'package:miniproject/models/model_diet_category.dart';
import 'package:miniproject/models/model_meals_plans.dart';
import 'package:miniproject/utils/api_service.dart';
import 'package:miniproject/views/screen_meals/screen_more_meals.dart';
import 'package:miniproject/views/screen_meals/screen_planner_meals.dart';

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
  double _targetCalories = 2250;
  String _diet = 'None';

  void _serachMealPlan() async {
    MealPlan mealPlan = await ApiService.instance.generateMealPlan(
      targetCalories: _targetCalories.toInt(),
      diet: _diet,
    );
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
              Container(
                height: 90,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: DesignSystem.mainBlue,
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
                                  borderRadius: BorderRadius.circular(7),
                                ),
                              ),
                              onPressed: () {},
                              child: const Text("My Favorite"),
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
              const SizedBox(height: 20),
              SizedBox(
                height: 200,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MealPlanScreen()),
                        );
                      },
                      child: Container(
                        width: 250,
                        height: 70,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: DesignSystem.mainRed,
                        ),
                        child: const Text("kategori 1"),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      width: 250,
                      height: 70,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: DesignSystem.mainYellow,
                      ),
                      child: const Text("kategori 2"),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      width: 250,
                      height: 70,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: DesignSystem.mainBlue,
                      ),
                      child: const Text("kategori 3"),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  const Text(
                    "Good For Diet",
                    style: DesignSystem.headlineSmall,
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const MoreMeals();
                      }));
                    },
                    child: const Text(
                      "See All",
                      style: DesignSystem.bodyMedium,
                    ),
                  )
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
                    onTap: () {},
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
