import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:miniproject/components/theme.dart';
import 'package:miniproject/views/screen_signIn/screen_signin.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 150,
              width: double.infinity,
              decoration: BoxDecoration(
                color: DesignSystem.mainGreen,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: SvgPicture.asset(
                  "assets/images/icons/app_logo.svg",
                ),
              ),
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: DesignSystem.secondYellow,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(
                    Icons.color_lens_rounded,
                    color: DesignSystem.mainRed,
                  ),
                ),
                const SizedBox(width: 20),
                const Text(
                  "Appareance",
                  style: DesignSystem.headlineSmall,
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.navigate_next_rounded),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: DesignSystem.secondYellow,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(
                    Icons.info_rounded,
                    color: DesignSystem.mainRed,
                  ),
                ),
                const SizedBox(width: 20),
                const Text(
                  "About SlimSage",
                  style: DesignSystem.headlineSmall,
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.navigate_next_rounded),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: DesignSystem.secondYellow,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(
                    Icons.insert_drive_file_rounded,
                    color: DesignSystem.mainRed,
                  ),
                ),
                const SizedBox(width: 20),
                const Text(
                  "Terms & Privacy Policy",
                  style: DesignSystem.headlineSmall,
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.navigate_next_rounded),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: DesignSystem.secondYellow,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(
                    Icons.logout_rounded,
                    color: DesignSystem.mainRed,
                  ),
                ),
                const SizedBox(width: 20),
                const Text(
                  "Log Out",
                  style: DesignSystem.headlineSmall,
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text(
                          "Logout?",
                          style: DesignSystem.headlineMedium,
                        ),
                        content: const Text(
                          "Are you sure you want to logout?",
                          style: DesignSystem.bodyLarge,
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text(
                              "Cancel",
                              style: DesignSystem.bodyMedium,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              FirebaseAuth.instance.signOut();
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("You has been logout"),
                                ),
                              );
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (contex) =>
                                          const SignInScreen()),
                                  (route) => false);
                            },
                            child: const Text(
                              "Logout",
                              style: DesignSystem.bodyMedium,
                            ),
                          )
                        ],
                      ),
                    );
                  },
                  icon: const Icon(Icons.navigate_next_rounded),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
