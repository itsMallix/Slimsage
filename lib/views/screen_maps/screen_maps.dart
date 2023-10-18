import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:miniproject/components/theme.dart';
import 'package:miniproject/views/screen_maps/screen_place.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final List<String> _place = ["1", "2", "3", "4", "5"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              const SizedBox(
                height: 45,
                width: double.infinity,
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.search),
                    fillColor: DesignSystem.grey,
                    filled: true,
                    hintText: "Search Places",
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ListView.builder(
                itemCount: _place.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Card(
                    color: DesignSystem.secondGreen,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Image.asset(
                                "assets/images/onBoarding/onBoarding_1.png",
                                height: 100,
                                width: 100,
                                fit: BoxFit.cover,
                              ),
                              const SizedBox(height: 20),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    const SizedBox(height: 5),
                                    const Text(
                                      "Place 1",
                                      style: DesignSystem.bodyLarge,
                                    ),
                                    const SizedBox(height: 10),
                                    const Text(
                                      "subtitile",
                                      style: DesignSystem.bodyMedium,
                                    ),
                                    const SizedBox(height: 10),
                                    const Text(
                                      "content lorem ipsum dolor sit amet",
                                      maxLines: 2,
                                      style: DesignSystem.bodyMedium,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                  // return Padding(
                  //   padding: const EdgeInsets.symmetric(vertical: 8.0),
                  //   child: Container(
                  //     height: 150,
                  //     decoration: BoxDecoration(
                  //         color: DesignSystem.secondYellow,
                  //         borderRadius: BorderRadius.circular(10)),
                  //     child: ListTile(
                  //       title: Text(_place[index]),
                  //       subtitle: const Text("subtitile"),
                  //       leading: const Icon(Icons.abc),
                  //       trailing: const Icon(Icons.favorite),
                  //     ),
                  //   ),
                  // );
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (contex) => const PlaceScreen(),
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
