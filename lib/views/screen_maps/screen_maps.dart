import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:miniproject/components/screen_maps/maps_health.dart';
import 'package:miniproject/components/screen_maps/maps_most_visited.dart';
import 'package:miniproject/components/screen_maps/maps_popular.dart';
import 'package:miniproject/components/theme.dart';
import 'package:miniproject/views/screen_favorite/screen_favorite_places.dart';
import 'package:miniproject/views/screen_maps/screen_Gmaps.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Container(
                height: 100,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: DesignSystem.black,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  children: [
                    const SizedBox(width: 10),
                    SizedBox(
                      height: 90,
                      width: 90,
                      child: SvgPicture.asset(
                        "assets/images/mapScreen/compass.svg",
                      ),
                    ),
                    const SizedBox(width: 20),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const SizedBox(
                            // height: 0,
                            width: 200,
                            child: Text(
                              "Discover Favorite Fitness Center Near You Easily",
                              style: DesignSystem.headlineSmallWhite,
                              textAlign: TextAlign.end,
                            ),
                          ),
                          const SizedBox(height: 10),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => FavoritePlaceScreen(),
                                ),
                              );
                            },
                            child: Container(
                              alignment: Alignment.center,
                              height: 30,
                              width: 130,
                              decoration: BoxDecoration(
                                color: DesignSystem.mainYellow,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: const Text(
                                "My Favorite",
                                style: DesignSystem.headlineSmallWhite,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Popular Places",
                style: DesignSystem.headlineSmall,
              ),
              const SizedBox(height: 10),
              const BuildPopularPlace(),
              const SizedBox(height: 10),
              const Text(
                "Most Visited Places",
                style: DesignSystem.headlineSmall,
              ),
              const SizedBox(height: 10),
              const BuildMostVisited(),
              const SizedBox(height: 10),
              const Text(
                "Health Center Places",
                style: DesignSystem.headlineSmall,
              ),
              const SizedBox(height: 10),
              const BuildHealthPlace(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (contex) => const GmapsScreen(),
            ),
          );
        },
        backgroundColor: DesignSystem.mainBlue,
        child: const Icon(Icons.location_searching_rounded,
            color: DesignSystem.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
