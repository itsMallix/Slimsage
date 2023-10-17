import 'package:flutter/material.dart';
import 'package:miniproject/views/screen_boarding/screen_boarding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // colorScheme: ColorScheme.fromSeed(seedColor: DesignSystem.mainGreen),
        useMaterial3: true,
      ),
      home: BoardingScreen(),
    );
  }
}
