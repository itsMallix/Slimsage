import 'dart:ui';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:miniproject/firebase_options.dart';
import 'package:miniproject/models/database_models/database_provider.dart';
import 'package:miniproject/models/maps_models/maps_favorite_provider.dart';
import 'package:miniproject/models/progress_models/progress_provider.dart';
import 'package:miniproject/viewModels/viewModels_users.dart';
import 'package:miniproject/views/screen_boarding/screen_splash.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ProgressProvider>(
            create: (_) => ProgressProvider()),
        ChangeNotifierProvider(create: (_) => DbManager()),
        ChangeNotifierProvider(create: (_) => PlaceFavoriteProvider()),
        ChangeNotifierProvider<UserManager>(create: (_) => UserManager()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'SlimSage',
        theme: ThemeData(
          useMaterial3: true,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
