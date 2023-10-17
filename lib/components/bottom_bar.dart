import 'package:flutter/material.dart';
import 'package:miniproject/components/theme.dart';
import 'package:miniproject/views/screen_home/screen_home.dart';
import 'package:miniproject/views/screen_maps/screen_maps.dart';
import 'package:miniproject/views/screen_meals/screen_meals.dart';
import 'package:miniproject/views/screen_progress/screen_progress.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  PageController _pageController = PageController(initialPage: 0);
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const HomeScreen(),
    const ProgresScreen(),
    const MealScreen(),
    const MapScreen(),
  ];

  void _onTapped(int index) {
    setState(() {
      _currentIndex = index;
      _pageController.jumpToPage(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Hello User",
          style: DesignSystem.headlineMedium,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.person),
          ),
        ],
      ),
      body: PageView(
        controller: _pageController,
        children: _pages,
        onPageChanged: (int index) {
          setState(
            () {
              _currentIndex = index;
            },
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: DesignSystem.mainGreen,
        unselectedItemColor: DesignSystem.maingrey,
        showUnselectedLabels: true,
        currentIndex: _currentIndex,
        onTap: _onTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_filled,
              color: _currentIndex == 0
                  ? DesignSystem.mainGreen
                  : DesignSystem.maingrey,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.rocket_launch_rounded,
                color: _currentIndex == 1
                    ? DesignSystem.mainGreen
                    : DesignSystem.maingrey),
            label: "Progress",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.local_dining_rounded,
              color: _currentIndex == 2
                  ? DesignSystem.mainGreen
                  : DesignSystem.maingrey,
            ),
            label: "Meals",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.location_on_rounded,
              color: _currentIndex == 3
                  ? DesignSystem.mainGreen
                  : DesignSystem.maingrey,
            ),
            label: "Maps",
          ),
        ],
      ),
    );
  }
}
