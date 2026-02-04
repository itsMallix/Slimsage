import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:miniproject/components/theme.dart';
import 'package:miniproject/views/screen_maps/screen_maps_detail.dart';

class BuildPopularPlace extends StatelessWidget {
  const BuildPopularPlace({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('places').snapshots(),
        builder: (context, snapshot) {
          List<Widget> placesWidgets = [];
          if (snapshot.hasData) {
            final places = snapshot.data?.docs.reversed.toList();
            for (var place in places!) {
              final placeWidget = GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MapDetailScreen(
                        placeData: place,
                      ),
                    ),
                  );
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: DesignSystem.maingrey),
                  ),
                  child: Stack(
                    children: [
                      SizedBox(
                        width: 300,
                        height: 200,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image(
                            image: NetworkImage(place['image']),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        child: Container(
                          width: 300,
                          decoration: const BoxDecoration(
                            color: DesignSystem.white,
                            borderRadius: BorderRadius.vertical(
                              bottom: Radius.circular(20),
                            ),
                          ),
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    place['name'],
                                    style: DesignSystem.headlineMedium,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        place['open'],
                                        style: DesignSystem.bodySmall,
                                      ),
                                      const SizedBox(
                                        width: 5,
                                        child: Text("-"),
                                      ),
                                      Text(
                                        place['close'],
                                        style: DesignSystem.bodySmall,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 250,
                                    child: Text(
                                      place['address'],
                                      style: DesignSystem.bodySmall,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
              placesWidgets.add(placeWidget);
            }
          }
          return ListView(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            children: placesWidgets,
          );
        },
      ),
    );
  }
}
