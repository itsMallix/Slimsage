import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:miniproject/components/theme.dart';
import 'package:miniproject/views/screen_login/screen_login.dart';

class BoardingScreen extends StatefulWidget {
  const BoardingScreen({super.key});

  @override
  State<BoardingScreen> createState() => _BoardingScreenState();
}

class _BoardingScreenState extends State<BoardingScreen> {
  late PageController _pageController;
  int _pageIndex = 0;

  // @override
  // void initState() {
  //   _pageController = PageController(initialPage: 0);
  // }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginScreen(),
                ),
              );
            },
            child: const Text(
              "Skip",
              style: DesignSystem.labelLarge,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  itemCount: onboardData.length,
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      _pageIndex = index;
                    });
                  },
                  itemBuilder: (context, index) => OnboardingContent(
                    image: onboardData[index].image,
                    title: onboardData[index].title,
                    description: onboardData[index].description,
                  ),
                ),
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Spacer(),
                      ...List.generate(
                        onboardData.length,
                        (index) => Padding(
                          padding: EdgeInsets.only(right: 5),
                          child: DotIndicator(isActive: index == _pageIndex),
                        ),
                      ),
                      Spacer(),
                    ],
                  ),
                  SizedBox(height: 20), // Spacer(),
                  SizedBox(
                    height: 60,
                    width: 200,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: DesignSystem.mainGreen),
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ),
                        );
                        // _pageController.nextPage(
                        //     duration: Duration(milliseconds: 300),
                        //     curve: Curves.ease);
                      },
                      child: const Text(
                        "Get Started",
                        style: DesignSystem.headlineMediumWhite,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class DotIndicator extends StatelessWidget {
  const DotIndicator({
    super.key,
    this.isActive = false,
  });

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: isActive ? 10 : 4,
      width: 20,
      decoration: BoxDecoration(
        color: isActive ? DesignSystem.mainRed : DesignSystem.secondRed,
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
      ),
    );
  }
}

class Onboard {
  final String image, title, description;

  Onboard({
    required this.image,
    required this.title,
    required this.description,
  });
}

final List<Onboard> onboardData = [
  Onboard(
    image: "assets/images/onBoarding/onBoarding_1.png",
    title: "Eat Healthy",
    description:
        "Maintaining good health should be the primary focus of everyone",
  ),
  Onboard(
    image: "assets/images/onBoarding/onBoarding_2.png",
    title: "Healthy Recipe",
    description:
        "Brows thousands of healthy recipes from all over the world for free",
  ),
  Onboard(
    image: "assets/images/onBoarding/onBoarding_3.png",
    title: "Show Your Progress",
    description:
        "With amazing inbuilt tools you can track your progress to achieve your goals",
  ),
  Onboard(
    image: "assets/images/onBoarding/onBoarding_2.png",
    title: "Welcome to",
    description: "Diet Adventure",
  ),
];

class OnboardingContent extends StatelessWidget {
  const OnboardingContent({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });

  final String image;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 50),
        Container(
          height: 50,
          // decoration: BoxDecoration(color: Colors.amber),
          child: SvgPicture.asset(
            "assets/images/icons/app_logo.svg",
            color: DesignSystem.mainGreen,
          ),
        ),
        const Text(
          "Empowering Your Journey to Wellness",
          style: DesignSystem.bodyMedium,
        ),
        const Spacer(),
        Image.asset(
          image,
          height: 250,
        ),
        Text(
          title,
          textAlign: TextAlign.center,
          style: DesignSystem.headlineMedium,
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
            description,
            style: DesignSystem.bodyLarge,
            textAlign: TextAlign.center,
          ),
        ),
        const Spacer(),
      ],
    );
  }
}
