import 'package:flutter/material.dart';
import 'package:miniproject/components/theme.dart';
import 'package:miniproject/views/screen_maps/screen_Gmaps.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final List<String> _place_1 = ["1", "2", "3"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
              Container(
                height: 100,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: DesignSystem.black,
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Popular Places",
                style: DesignSystem.headlineSmall,
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 200,
                child: ListView.builder(
                  itemCount: _place_1.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const ClampingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Card(
                      child: Container(
                        height: 200,
                        width: 250,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 120,
                              child: ClipRRect(
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(10)),
                                child: Image.asset(
                                  "assets/images/test.png",
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 12.0),
                              child: Row(
                                children: [
                                  const Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Ini Title Test",
                                        style: DesignSystem.headlineMedium,
                                      ),
                                      Text(
                                        "ini sub titele Test",
                                        style: DesignSystem.bodyLarge,
                                      ),
                                      Text(
                                        "ini deskripsi test",
                                        style: DesignSystem.bodyMedium,
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: DesignSystem.mainGreen,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                    ),
                                    onPressed: () {},
                                    child: const Text(
                                      "Detail",
                                      style: DesignSystem.bodyMediumWhite,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "Popular Indoor Place",
                style: DesignSystem.headlineSmall,
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
              builder: (contex) => const GmapsScreen(),
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
