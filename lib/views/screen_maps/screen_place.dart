import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:miniproject/views/screen_maps/map_test.dart';
import 'package:miniproject/views/screen_maps/screen_Gmaps.dart';
import 'package:url_launcher/url_launcher_string.dart';

class PlaceScreen extends StatefulWidget {
  const PlaceScreen({super.key});

  @override
  State<PlaceScreen> createState() => _PlaceScreenState();
}

class _PlaceScreenState extends State<PlaceScreen> {
  late String lat;
  late String long;
  String locationMessage = "Testis";

  Future<Position> _getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled');
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location permissions ');
    }

    return await Geolocator.getCurrentPosition();
  }

  void _liveLocation() {
    LocationSettings locationSettings = const LocationSettings(
      accuracy: LocationAccuracy.bestForNavigation,
      distanceFilter: 100,
    );
    Geolocator.getPositionStream(locationSettings: locationSettings)
        .listen((Position position) {
      lat = position.latitude.toString();
      long = position.longitude.toString();

      setState(() {
        locationMessage = 'lat: $lat, long: $long';
      });
    });
  }

  Future<void> _openMap(String lat, String long) async {
    String url = 'https://www.google.com/maps/search/?api=1&query=$lat,$long';
    await canLaunchUrlString(url)
        ? await launchUrlString(url)
        : throw 'Could not launch $url';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        // body: Center(
        //   child: Column(
        //     children: [
        //       Spacer(),
        //       Text(locationMessage),
        //       ElevatedButton(
        //         onPressed: () {
        //           _getCurrentLocation().then((value) {
        //             lat = '${value.latitude}';
        //             long = '${value.longitude}';
        //             setState(() {
        //               locationMessage = 'lat: $lat, long: $long';
        //             });
        //             _liveLocation();
        //           });
        //         },
        //         child: Text("get location"),
        //       ),
        //       Spacer(),
        //       ElevatedButton(
        //         onPressed: () {
        //           _openMap(lat, long);
        //         },
        //         child: Text("open maps"),
        //       ),
        //       Spacer(),
        //     ],
        //   ),
        // ),
        );
  }
}
