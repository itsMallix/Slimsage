import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:miniproject/firebase_options.dart';
import 'package:miniproject/views/screen_boarding/screen_boarding.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter SlimSage',
      theme: ThemeData(
        // colorScheme: ColorScheme.fromSeed(seedColor: DesignSystem.mainGreen),
        useMaterial3: true,
      ),
      home: const BoardingScreen(),
    );
  }
}
