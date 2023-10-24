import 'package:flutter/material.dart';
import 'package:miniproject/components/theme.dart';
import 'package:provider/provider.dart';
import 'package:miniproject/models/maps_models/maps_favorite_provider.dart';

class FavoritePlaceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PlaceFavoriteProvider>(context);
    final favoritePlaces = provider.places;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Favorites Place",
          style: DesignSystem.headlineMedium,
        ),
      ),
      body: ListView.builder(
        itemCount: favoritePlaces.length,
        itemBuilder: (context, index) {
          final placeData = favoritePlaces[index];
          // You can customize how you want to display the favorite place data here
          return ListTile(
            title: Text(placeData['name']),
            trailing: IconButton(
              onPressed: () {
                provider.toggleFavorite(favoritePlaces[index]);
              },
              icon: Icon(Icons.delete),
            ),
            // Add more information or customize the list item as needed
          );
        },
      ),
    );
  }
}
