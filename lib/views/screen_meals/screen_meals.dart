import 'package:flutter/material.dart';
import 'package:miniproject/components/theme.dart';

class MealScreen extends StatefulWidget {
  const MealScreen({Key? key}) : super(key: key);

  @override
  State<MealScreen> createState() => _MealScreenState();
}

class _MealScreenState extends State<MealScreen> {
  final List<String> _meals = ["1", "2", "3", "4", "5"];
  // late TabController controller;

  // @override
  // void initState() {
  //   controller = TabController(
  //       length: 2, vsync: this); // Tambahkan TabController dengan panjang 2.
  //   super.initState();
  // }

  // @override
  // void dispose() {
  //   controller.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              // TabBar(
              //   controller: controller,
              //   tabs: const <Widget>[
              //     Tab(
              //       child: SizedBox(
              //         height: 40,
              //         child: Text(
              //           "Meals Menu",
              //           style: DesignSystem.bodyLarge,
              //         ),
              //       ),
              //     ),
              //     Tab(
              //       child: SizedBox(
              //         height: 40,
              //         child: Text(
              //           "My Favorite",
              //           style: DesignSystem.bodyLarge,
              //         ),
              //       ),
              //     ),
              //   ],
              // ),
              const SizedBox(height: 30),
              SizedBox(
                height: 200,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    Container(
                      width: 250,
                      height: 70,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: DesignSystem.mainRed,
                      ),
                      child: const Text("kategori 1"),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      width: 250,
                      height: 70,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: DesignSystem.mainYellow,
                      ),
                      child: const Text("kategori 2"),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      width: 250,
                      height: 70,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: DesignSystem.mainBlue,
                      ),
                      child: const Text("kategori 3"),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Good For Diet",
                  style: DesignSystem.headlineSmall,
                ),
              ),
              const SizedBox(height: 20),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: _meals.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                          color: DesignSystem.secondYellow,
                          borderRadius: BorderRadius.circular(10)),
                      child: ListTile(
                        title: Text(_meals[index]),
                        subtitle: const Text("subtitile"),
                        leading: const Icon(Icons.abc),
                        trailing: const Icon(Icons.favorite),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
