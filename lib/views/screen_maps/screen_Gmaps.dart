import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:miniproject/components/theme.dart';

class GmapsScreen extends StatefulWidget {
  const GmapsScreen({
    super.key,
  });

  @override
  State<GmapsScreen> createState() => GmapsScreenState();
}

class GmapsScreenState extends State<GmapsScreen> {
  LatLng defaultPosition = const LatLng(37.42796133580664, -122.085749655962);
  GoogleMapController? mapController;

  @override
  void initState() {
    super.initState();
    _getCurrentLocation().then((value) {
      setState(() {
        defaultPosition = LatLng(value.latitude, value.longitude);
      });
    });
  }

  @override
  void dispose() {
    mapController?.dispose();
    super.dispose();
  }

  void _showInfoBottomSheet(
      BuildContext context,
      String name,
      String image,
      String rating,
      String open,
      String close,
      String address,
      double latitude,
      double longitude) {
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

  Future<Set<Marker>> _placeMarker() async {
    Set<Marker> markers = {};

    Position position = await _getCurrentLocation();
    LatLng currentLocation = LatLng(position.latitude, position.longitude);

    markers.add(
      Marker(
        markerId: const MarkerId("My Location"),
        position: currentLocation,
        infoWindow: const InfoWindow(title: "My Location"),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
      ),
    );

    QuerySnapshot querySnapshot1 = await FirebaseFirestore.instance
        .collection('places_most_visited')
        .get();
    querySnapshot1.docs.forEach((DocumentSnapshot doc) {
      double latitude = doc['latitude'];
      double longitude = doc['longitude'];
      String name = doc['name'];
      String image = doc['image'];
      String rating = doc['rating'];
      String open = doc['open'];
      String close = doc['close'];
      String address = doc['address'];

      LatLng coordinate = LatLng(latitude, longitude);
      markers.add(
        Marker(
          markerId: MarkerId(coordinate.toString()),
          position: coordinate,
          infoWindow: InfoWindow(
            title: name,
            onTap: () {
              _showInfoBottomSheet(context, name, image, rating, open, close,
                  address, latitude, longitude);
            },
          ),
        ),
      );
    });

    QuerySnapshot querySnapshot2 =
        await FirebaseFirestore.instance.collection('places').get();
    querySnapshot2.docs.forEach((DocumentSnapshot doc) {
      double latitude = doc['latitude'];
      double longitude = doc['longitude'];
      String name = doc['name'];
      String image = doc['image'];
      String rating = doc['rating'];
      String open = doc['open'];
      String close = doc['close'];
      String address = doc['address'];

      LatLng coordinate = LatLng(latitude, longitude);
      markers.add(
        Marker(
          markerId: MarkerId(coordinate.toString()),
          position: coordinate,
          infoWindow: InfoWindow(
            title: name,
            onTap: () {
              _showInfoBottomSheet(context, name, image, rating, open, close,
                  address, latitude, longitude);
            },
          ),
        ),
      );
    });
    return markers;
  }

  Future<Position> _getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw 'Location services are disabled';
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw 'Location permissions are denied';
      }
    }

    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Location permissions are permanently denied, we cannot request permissions.',
          ),
        ),
      );
    }
    return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Search a Place",
          style: DesignSystem.headlineMedium,
        ),
      ),
      body: FutureBuilder<Set<Marker>>(
        future: _placeMarker(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text('Error'),
            );
          } else {
            return GoogleMap(
              mapType: MapType.normal,
              initialCameraPosition: CameraPosition(
                target: defaultPosition,
                zoom: 14,
              ),
              onMapCreated: (controller) {
                mapController = controller;
              },
              markers: snapshot.data!,
            );
          }
        },
      ),
      floatingActionButton: SizedBox(
        height: 50,
        width: 160,
        child: FloatingActionButton(
          onPressed: () async {
            try {
              Position value = await _getCurrentLocation();
              setState(() {
                defaultPosition = LatLng(value.latitude, value.longitude);
              });
              mapController?.animateCamera(
                CameraUpdate.newCameraPosition(
                  CameraPosition(
                    target: defaultPosition,
                    zoom: 14.0,
                  ),
                ),
              );
            } catch (e) {
              print('Error: $e');
            }
          },
          backgroundColor: DesignSystem.black,
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(
                  Icons.location_on_rounded,
                  color: Colors.white,
                ),
                Text(
                  "Get My Location",
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
    );
  }
}
