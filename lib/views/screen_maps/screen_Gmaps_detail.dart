import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GmapsScreenDetail extends StatelessWidget {
  final String name;
  final double latitude;
  final double longitude;
  const GmapsScreenDetail({
    super.key,
    required this.name,
    required this.latitude,
    required this.longitude,
  });

  void _showInfoBottomSheet(BuildContext context, String name) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        height: 300,
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text("Name: $name"),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Place Details"),
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(latitude, longitude),
          zoom: 15.0,
        ),
        markers: {
          Marker(
            markerId: MarkerId(name),
            position: LatLng(latitude, longitude),
            infoWindow: InfoWindow(
              title: name,
              onTap: () {
                _showInfoBottomSheet(context, name);
              },
            ),
          ),
        },
      ),
    );
  }
}
