import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:miniproject/components/theme.dart';

class GmapsScreenDetail extends StatelessWidget {
  final String name;
  final double latitude;
  final double longitude;
  final String image;
  final String address;
  final String rating;
  final String open;
  final String close;

  const GmapsScreenDetail({
    super.key,
    required this.name,
    required this.latitude,
    required this.longitude,
    required this.image,
    required this.address,
    required this.rating,
    required this.open,
    required this.close,
  });

  void _showInfoBottomSheet(
      BuildContext context, String name, String image, String address) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        height: 400,
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 120,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(image, fit: BoxFit.cover)),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const Icon(
                  Icons.maps_home_work_rounded,
                  color: DesignSystem.mainBlue,
                ),
                const SizedBox(width: 5),
                Text(
                  name,
                  style: DesignSystem.headlineMedium,
                ),
                const Spacer(),
                const Icon(
                  Icons.star_rounded,
                  color: DesignSystem.mainYellow,
                ),
                Text(
                  rating,
                  style: DesignSystem.bodyLarge,
                )
              ],
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                const Icon(
                  Icons.location_on_rounded,
                  color: DesignSystem.mainBlue,
                ),
                const SizedBox(width: 5),
                Text(
                  '$latitude, $longitude',
                  style: DesignSystem.bodyMedium,
                ),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                const Icon(
                  Icons.timelapse_rounded,
                  color: DesignSystem.mainBlue,
                ),
                const SizedBox(width: 5),
                Text(
                  '$open - $close',
                  style: DesignSystem.bodyMedium,
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              address,
              style: DesignSystem.bodyLarge,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Place Details",
          style: DesignSystem.headlineMedium,
        ),
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
                _showInfoBottomSheet(context, name, image, address);
              },
            ),
          ),
        },
      ),
    );
  }
}
