import 'package:flutter/material.dart';
import 'package:miniproject/components/theme.dart';
import 'package:miniproject/views/screen_favorite/empty_favorite_place.dart';
import 'package:provider/provider.dart';
import 'package:miniproject/models/maps_models/maps_favorite_provider.dart';

class FavoritePlaceScreen extends StatelessWidget {
  const FavoritePlaceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final provider = Provider.of<PlaceFavoriteProvider>(context);
    // final favoritePlaces = provider.places;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Favorites Places",
          style: DesignSystem.headlineMedium,
        ),
      ),
      body: buildFavoritePlaceScreen(context),
    );
  }

  Widget buildFavoritePlaceScreen(BuildContext context) {
    final provider = Provider.of<PlaceFavoriteProvider>(context);
    final favoritePlaces = provider.places;

    return Consumer<PlaceFavoriteProvider>(
      builder: (context, value, child) {
        if (value.places.isNotEmpty) {
          return ListView.builder(
            itemCount: value.places.length,
            itemBuilder: (context, index) {
              final placeData = value.places[index];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  height: 100,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(color: DesignSystem.maingrey),
                    borderRadius: BorderRadius.circular(10),
                    color: DesignSystem.white,
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        height: 80,
                        width: 120,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            placeData['image'],
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            placeData['name'],
                            style: DesignSystem.headlineMedium,
                          ),
                          const Spacer(),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                  height: 40,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: DesignSystem.mainBlue,
                                  ),
                                  child: const Icon(
                                    Icons.my_location_rounded,
                                    color: DesignSystem.white,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              GestureDetector(
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      title: Text(
                                        "${"Delete " + placeData['name']}?",
                                        style: DesignSystem.headlineMedium,
                                      ),
                                      content: const Text(
                                        "Are you sure you want to delete this place?",
                                      ),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: const Text("No",
                                              style: DesignSystem.bodyMedium),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            provider.toggleFavorite(
                                                favoritePlaces[index]);
                                            Navigator.pop(context);
                                          },
                                          child: const Text("Yes",
                                              style: DesignSystem.bodyMedium),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                                child: Container(
                                  height: 40,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: DesignSystem.mainRed,
                                  ),
                                  child: const Icon(
                                    Icons.delete_rounded,
                                    color: DesignSystem.white,
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
          );
        } else {
          return const EmptyPlaceScreen();
        }
      },
    );
  }
}
