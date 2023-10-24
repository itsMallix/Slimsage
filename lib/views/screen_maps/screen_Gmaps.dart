import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:miniproject/components/theme.dart';

class GmapsScreen extends StatefulWidget {
  const GmapsScreen({Key? key});

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

      LatLng coordinate = LatLng(latitude, longitude);
      markers.add(
        Marker(
          markerId: MarkerId(coordinate.toString()),
          position: coordinate,
          infoWindow: InfoWindow(
            title: name,
            onTap: () {
              _showInfoBottomSheet(context, name);
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

      LatLng coordinate = LatLng(latitude, longitude);
      markers.add(
        Marker(
          markerId: MarkerId(coordinate.toString()),
          position: coordinate,
          infoWindow: InfoWindow(
            title: name,
            onTap: () {
              _showInfoBottomSheet(context, name);
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
      // throw 'Location permissions are permanently denied';
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
        ),
        centerTitle: true,
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
