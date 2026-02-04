import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PlaceFavoriteProvider extends ChangeNotifier {
  List<QueryDocumentSnapshot> _places = [];
  List<QueryDocumentSnapshot> get places => _places;

  // List<String> _places = [];
  // List<String> get place => _places;

  void toggleFavorite(QueryDocumentSnapshot placeData) {
    final isExist = _places.contains(placeData);
    if (isExist) {
      _places.remove(placeData);
    } else {
      _places.add(placeData);
    }
    notifyListeners();
  }

  bool isExist(QueryDocumentSnapshot placeData) {
    final isExist = _places.contains(placeData);
    return isExist;
  }

  void clearFavorite() {
    _places = [];
    notifyListeners();
  }
}
