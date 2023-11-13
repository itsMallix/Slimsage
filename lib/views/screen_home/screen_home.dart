import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:miniproject/components/theme.dart';
import 'package:miniproject/views/screen_calculator_bmi/screen_calculator_bmi.dart';
import 'package:miniproject/views/screen_favorite/screen_favorite_meals.dart';
import 'package:miniproject/views/screen_favorite/screen_favorite_places.dart';
import 'package:miniproject/views/screen_progress/screen_progress_item.dart';
import 'package:miniproject/views/screen_recommendation/screen_home_recommendation.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const SizedBox(height: 24),
              Container(
                decoration: BoxDecoration(
                    color: DesignSystem.mainYellow,
                    borderRadius: BorderRadius.circular(20)),
                height: 150,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "C A L C U L A T E",
                            style: DesignSystem.headlineSmall,
                            textAlign: TextAlign.start,
                          ),
                          const SizedBox(
                            width: 170,
                            child: Text(
                              "Track Your Body Mass Index",
                              style: DesignSystem.headlineMediumWhite,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Container(
                            height: 40,
                            width: 110,
                            decoration: BoxDecoration(
                              color: DesignSystem.mainRed,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: DesignSystem.mainRed,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const BmiScreen(),
                                  ),
                                );
                              },
                              child: const Text(
                                "Calculate",
                                style: DesignSystem.bodyMediumWhite,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      SvgPicture.asset("assets/images/homeScreen/object_1.svg"),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RecommendScreen(),
                        ),
                      );
                    },
                    child: Container(
                      height: 160,
                      width: 165,
                      decoration: BoxDecoration(
                        color: DesignSystem.mainBlue,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 70,
                              width: 70,
                              child: SvgPicture.asset(
                                "assets/images/homeScreen/object_2.svg",
                              ),
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              "Recommended Workout",
                              style: DesignSystem.headlineSmallWhite,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ProgressItem(),
                        ),
                      );
                    },
                    child: Container(
                      height: 160,
                      width: 165,
                      decoration: BoxDecoration(
                        color: DesignSystem.mainGreen,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 70,
                              width: 70,
                              child: SvgPicture.asset(
                                "assets/images/homeScreen/object_3.svg",
                              ),
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              "Upload Your Progress",
                              style: DesignSystem.headlineSmallWhite,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Choose Your Favorites",
                  style: DesignSystem.headlineSmall,
                ),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const FavoriteMealScreen(),
                    ),
                  );
                },
                child: Container(
                  height: 70,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: DesignSystem.secondRed,
                  ),
                  child: const Row(
                    children: [
                      SizedBox(width: 20),
                      CircleAvatar(
                        radius: 20,
                        backgroundColor: DesignSystem.mainRed,
                        child: Icon(
                          Icons.kebab_dining_rounded,
                          color: DesignSystem.white,
                        ),
                      ),
                      SizedBox(width: 20),
                      Text(
                        "Favorite Meals",
                        style: DesignSystem.headlineSmall,
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const FavoritePlaceScreen(),
                    ),
                  );
                },
                child: Container(
                  height: 70,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: DesignSystem.secondYellow,
                  ),
                  child: const Row(
                    children: [
                      SizedBox(width: 20),
                      CircleAvatar(
                        radius: 20,
                        backgroundColor: DesignSystem.mainYellow,
                        child: Icon(
                          Icons.home_work_rounded,
                          color: DesignSystem.white,
                        ),
                      ),
                      SizedBox(width: 20),
                      Text(
                        "Favorite Place",
                        style: DesignSystem.headlineSmall,
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // GestureDetector(
              //   onTap: () {},
              //   child: Container(
              //     height: 70,
              //     width: double.infinity,
              //     decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(20),
              //       color: DesignSystem.secondBlue,
              //     ),
              //     child: const Row(
              //       children: [
              //         SizedBox(width: 20),
              //         CircleAvatar(
              //           radius: 20,
              //           backgroundColor: DesignSystem.mainBlue,
              //           child: Icon(
              //             Icons.chat_rounded,
              //             color: DesignSystem.white,
              //           ),
              //         ),
              //         SizedBox(width: 20),
              //         Text(
              //           "Talk With Sagy",
              //           style: DesignSystem.headlineSmall,
              //         )
              //       ],
              //     ),
              //   ),
              // ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
