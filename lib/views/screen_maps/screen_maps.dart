import 'package:flutter/material.dart';
import 'package:miniproject/components/theme.dart';

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
                    hintText: "Search Menu",
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ListView.builder(
                itemCount: _place.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Container(
                      height: 150,
                      decoration: BoxDecoration(
                          color: DesignSystem.secondYellow,
                          borderRadius: BorderRadius.circular(10)),
                      child: ListTile(
                        title: Text(_place[index]),
                        subtitle: const Text("subtitile"),
                        leading: const Icon(Icons.abc),
                        trailing: const Icon(Icons.favorite),
                      ),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
