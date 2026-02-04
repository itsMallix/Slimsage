import 'package:google_maps_flutter/google_maps_flutter.dart';

class MarkerData {
  LatLng coordinate;
  String name;

  MarkerData({
    required this.coordinate,
    required this.name,
  });
}
