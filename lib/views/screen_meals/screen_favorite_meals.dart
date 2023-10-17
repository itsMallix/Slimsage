import 'package:flutter/material.dart';

class FavMealScreen extends StatefulWidget {
  const FavMealScreen({super.key});

  @override
  State<FavMealScreen> createState() => _FavMealScreenState();
}

class _FavMealScreenState extends State<FavMealScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        children: <Widget>[
          Tab(
            icon: Icon(Icons.abc),
          )
        ],
      ),
    );
  }
}
